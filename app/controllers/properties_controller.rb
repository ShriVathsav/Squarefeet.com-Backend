class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]
  before_action :accept_all_params

  # GET /properties
  def index
    locality = "%" + (!!params[:locality] ? params[:locality] : "") + "%"
    city = "%" + (!!params[:city] ? params[:city] : "") + "%"
    list_property_for = (!!params[:type] ? params[:type] : "Sale")
    props = []
    
    sql = "Select * from Properties WHERE city LIKE '#{city}' AND locality LIKE '#{locality}'"
    
    sql3 = "select * from Properties inner join Amenities on amenities.property_id=Properties.id"
      
    sql4 = "SELECT t.*,
          (SELECT GROUP_CONCAT(s)
             FROM Amenities s 
            WHERE s.property_id = t.id) AS combinedsolutions
     FROM Properties t"
     
     sql5 = "SELECT t.*,
          x.combinedsolutions
     FROM Properties t
LEFT JOIN (SELECT s.property_id,
                  GROUP_CONCAT(s.name) AS combinedsolutions
             FROM Amenities s 
         GROUP BY s.property_id) x ON x.property_id = t.id"
         
    sql6 = "SELECT * FROM Properties AS s,
(
    SELECT property_id, array_to_string(array_agg(id), ',') AS assigned_users
    FROM Amenities 
    GROUP BY property_id) AS u 
WHERE s.id=u.property_id"

sql8 = "SELECT properties.id, array_to_string(array_agg(id), ',') AS assigned_users
FROM properties
JOIN amenities ON properties.id = amenities.property_id
GROUP BY users.user_ID, users.user"

sql7 = "select * from properties"


    jsonResult = {}
    
    sql2 = "SELECT * FROM Properties INNER JOIN Amenities ON Amenities.property_id=Properties.id"
    records_array = ActiveRecord::Base.connection.execute(sql3)
    
    #propd = Property.where("city = 'Kanchipuram'").where("locality = 'Periya'")
    #propc = Property.all
    
    mainQuery = ""
    strings = ""
    
    if(list_property_for == "Rent")
      strings = "city LIKE ? AND locality LIKE ? AND list_property_for = ? AND bedrooms IN (?) AND sub_property_type IN (?) 
        AND poster_designation IN (?) AND furnishing IN (?) AND (super_builtup_area >= ? AND super_builtup_area <= ? OR plot_area >= ? AND plot_area <= ?) AND rent >= ? AND rent <= ?" 
      mainQuery = Property.where(strings, city, locality, list_property_for, params[:bedrooms], params[:apartmentType], params[:postedBy], params[:furnishing], params[:minArea], params[:maxArea], params[:minArea], params[:maxArea], params[:minBudget], params[:maxBudget])
    else
      strings = "city LIKE ? AND locality LIKE ? AND list_property_for = ? AND bedrooms IN (?) AND sub_property_type IN (?) 
        AND poster_designation IN (?) AND transaction_type IN (?) AND furnishing IN (?) AND (super_builtup_area >= ? AND super_builtup_area <= ? OR plot_area >= ? AND plot_area <= ?) 
        AND price >= ? AND price <= ?"
      mainQuery = Property.where(strings, city, locality, list_property_for, params[:bedrooms], params[:apartmentType], params[:postedBy], params[:propertyStatus],  params[:furnishing], params[:minArea], params[:maxArea], params[:minArea], params[:maxArea], params[:minBudget], params[:maxBudget])
    end
    
      mainQuery.paginate(page: params[:page], per_page: 5).find_each do |prop|
      merged  = [prop.as_json, {:amenities => prop.amenities.as_json}, {:furnishings => prop.furnishings.as_json},
                  {:other_rooms => prop.other_rooms.as_json}, {:photos => prop.photos.as_json}]
      propertyCombined = merged.inject(&:merge)
      props.push(propertyCombined)
      jsonResult = {
        props: [],
        propertyCount: 1
      }
      #user.photos
    end
    #props = Property.joins("LEFT JOIN photos ON properties.id = photos.property_id")
    render json: {
        props: props,
        propertyCount: mainQuery.count
      }
  end

  # GET /properties/1
  def shows
    prop = Property.find(params[:id])
    merged  = [prop.as_json, {:amenities => prop.amenities.as_json}, {:furnishings => prop.furnishings.as_json},
                  {:other_rooms => prop.other_rooms.as_json}, {:photos => prop.photos.as_json}]
    propertyCombined = merged.inject(&:merge)
    render json: propertyCombined
  end
  
  # GET /properties/1
  def show
    render json: @property
  end

  # POST /propertiess
  def creates
    request_body = params.to_unsafe_h()
    ameneties_params = request_body["amenities"].class == NilClass ? [] : request_body["amenities"].values
    furnishing_params = request_body["furnishings"].class == NilClass ? [] : request_body["furnishings"].values
    other_rooms_params = request_body["other_rooms"].class == NilClass ? [] : request_body["other_rooms"].values
    photos_params = request_body["photos"].class == NilClass ? [] : request_body["photos"].values
    ActiveRecord::Base.transaction do
      @property = Property.create!(request_body[:property])
      @property.amenities.create!(ameneties_params) if ameneties_params != []
      @property.furnishings.create!(furnishing_params) if furnishing_params != []
      @property.other_rooms.create!(other_rooms_params) if other_rooms_params != []
      if photos_params != []
        photosList = save_to_s3(photos_params)
        @property.photos.create!(photosList)
      end
      #raise ActiveRecord::Rollback if john.is_an_asshole?
      render json: {id: @property.id}
    end
  end
  
  # POST /properties
  def create
    @property = Property.new(property_params)
    properties_posted = @property.profile.properties_posted + 1
    @property.profile.update!(properties_posted: properties_posted)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def property_params
      #params.require(:property).permit!
      
      params.fetch(:property, {})
    end
    
    def accept_all_params
      params.permit!
    end
    
    def save_to_s3(files)
      region = "ap-south-1"
      bucket = 'shrivrealestate'
      
      obj = Aws::S3::Client.new(
        credentials: Aws::Credentials.new('accesskey', 'secretkey'),
        region: region
      )
      
      #obj.put_object(bucket: bucket, key: "keys6", body: files)
      filesArray = []
      
      files.each do |file|
        key = SecureRandom.uuid
        
        obj.put_object(acl: "public-read", bucket: bucket, key: key, body: file) #.except(:id, :tag, :cover_photo)
        puts obj.inspect
        puts "H12"
        puts
        filesArray.push(path: "https://#{bucket}.s3.#{region}.amazonaws.com/#{key}", tag: "Others", cover_photo: false)
      end
      return filesArray
    end
end
