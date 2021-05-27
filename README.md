# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Market Place Links:

#### https://super-fun-time-marketplace.herokuapp.com/

#### https://github.com/jackiesun2/super-fun-time-marketplace

<!--

# Meets CR and demonstrates exceptional understanding of database queries

# Meets D and does so elegantly (queries chosen are the most elegant to achieve the result).

### Meets D and all comments are exceptionally written.

# Identifies and uses appropriate model methods for querying on self and its relationships, extends models scope where appropriate

# Minimise all database calls and implement eager loading where appropriate

# Validates and sanitises all input -->

<!-- site map -->

### Wireframes

Home page wireframe:

![homepage-wireframe](./../desktop-frame-1.png)

Profile page wireframe:

![profile-wireframe](./../desktop-frame-1.png)

Create review page wireframe:

![homepage-wireframe](./../desktop-frame-1.png)

Create listing page wireframe:

![homepage-wireframe](./../desktop-frame-1.png)

Listing page wireframe:

![homepage-wireframe](./../desktop-frame-1.png)

Create account page wireframe:

![homepage-wireframe](./../desktop-frame-1.png)

<!-- # Demonstrates a full understanding of the problems that exist in a relevant marketplace that needs disrupting -->

### Problem Statement

Outdoor activities hosted by experts are becoming more popular but a major barrier to entry for many outdoor lovers is the price tag associated with these activities. Online marketplaces like redballon and airbnb provide services that allow hosts to market their out activity. The issue is that these activities are expensive and won't be affordable for everyone. There are other free marketplaces like facebook groups, but the user interface is not intuitive and the amount of outdoor activities is limited. Furthermore, facebook does not provide reviews for hosts.

### Solution

Super fun time is a marketplace for outdoor lovers with no additional costs. Participants are expected to bring their own equipment and the host will provide information on what to bring. Super fun time allows users to host outdoor activities and join other outdoor activities hosted by others. Users a provided a profile where other users can leave reviews based on their experience. A map is provided on the listing page to let users know the meeting point.

The target users for this marketplace fall between the age range of 18 - 35. It's intended for students and young working professionals who enjoy the great outdoors but can't afford to pay for outdoor tour guides or experiences offered by other platforms such as airbnb and redballon.

### Project Management

To manage my workflow for the two way marketplace application, I used utilized a Trello board. Firstly, I checked the assignment requirements and listed all the necessary components of the web application and the readme documentation. The layout for my Trello board columns are as follows: backlog, todo, in progress, review/testing and done. I created cards which formed the groups of tasks that I need to complete to move the project forward. Examples of these tasks include: setting up rails, drafting an entity relationship diagram, completing wireframes and more. Within each task comprised of mini tasks in the form of a checklist. An example of this is within the wireframe task group, I needed to create a mood board to draw inspirations, sketch low fidelity wireframes and lastly use Figma to generate high fidelity wireframes. The backlog included all the tasks that I needed to do and each task would move along the columns until they were completed. During the process, I would realize that I had missed out on task groups as well as checklist tasks. This required me to fill out my Trello board with more tasks as I was building the marketplace application. The Trello board helped me manage my project workflow and ensured that I did not miss out on important tasks.

Trello Board Link:

https://trello.com/b/3tNoUjte/superfuntime

Trello Board Screenshot 1:
![trello-board-1](./../docs/trello-1.png)
Trello Board Screenshot 2:

Trello Board Screenshot 3:

Trello Board Screenshot 4:

Trello Board Screenshot 5:

Trello Board Screenshot 6:

Trello Board Screenshot 7:

Trello Board Screenshot 8:

Trello Board Screenshot 9:

#### Trello Board

### Application Screenshots

### User Stories

1. John, 19 year old university student studying marine biology
   As John, I want to invite people with me to my fishing trips, so that I can spread the workload and teach others how to fish.

2. Larry, 25 year old male working as an accountant
   As Larry, I want to find others that enjoy multi day hikes, so that I have like minded companionship while I go hiking.

3. Mary, 42 year old female working in the public sector
   As Mary, I want to explore the Victorian high country for free, so that I can enjoy the great outdoors whilst saving for my first property.

4. Aspiring Deer Hunter
   As an aspiring deer hunter, I want others that are interested in hunting to join me on a hunting trip, so that we can implement group hunting tactics such as ambushing and glassing.

5. Julie, 35 year old nurse
   As someone that is intrigued by birds, I want to find other bird lovers, so that I don't have to visit bird siting spots in regional NSW all alone.

#### Technology Stack

- HTML
- CSS
- SCSS
- Ruby
- Ruby on Rails
- JavaScript
- PostgreSQL
- Heroku
- Bootstrap
- Mapbox
- Amazon S3

# Site Maps

I created a sitemap on diagrams.net. In doing so, I gained clarity around the structure of my webpages and how I would like to have my pages arranged.

### Functionality and Features

#### CRUD

Super fun time offers full CRUD capabilities. These capabilities are available for multiple areas of the web application. This includes for the user and the listings. As a user, you can create an account and edit your profile. For the listings, users can add a listing, edit a listing, delete a listing and also view other listings by other users. The crud functionality will only be available to users for their own profile and their own listings. A user cannot delete or edit another users listings or another users profile. However, users can view profiles and listings of other users.

#### Authentication and Authorization

Authentication ensures that users are who they say they are. To ensure this, the devise gem was implemented. Devise does this by providing a suite of functionality such as checking the uniqueness of emails, checking the length of passwords and more. By doing so, devise offers a simple solution that provides all the necessary models, views and controllers. Without Authentication, users will be able to log in as other users. This can be problematic for many reasons, such as false listings by users.

Authorization refers to the function of permitting access and rights to resources. In order to ensure that users are only given access to their own listings and own profiles, authorization was implemented. To implement this, a method with the appropriate logic was implemented in the controllers of the relevant paths. An example of this is provided below, where only the user who created the listing will have the ability to edit the listing.

```ruby
def authorize_user
    @listing = current_user.listing.find_by_id(params[:id])
    return if @listing
    flash[:alert] = "You cannot edit unless you created the listing"
    redirect_to listings_path
end
```

#### Reviews

A review section was implemented for each users profile page. By providing a review section, the marketplace provides transparent information on users based on the experience of other users. Based on the reviews of user profiles, other users can make informed decisions on whether to attend a listing by one host verses another host. It's likely that users will choose the host with better reviews and likewise users can choose to avoid hosts with poor reviews. A user has the ability to leave reviews for other hosts or other participants that attended a listing.

#### Bookings

Users have the ability to attend listings by making a reservation on the listing. Once a user confirms that they can attend, their names will appear on the attendee list. A user has the ability to cancel their participation anytime and once they do their names will disappear from the attendee list. As a host, you can have other users book a spot in your listing, but you also have the ability to book as a participant in another host's listing. Therefore, a user becomes a host when they make a listing, and a user becomes a participant when the book a listing hosted by another user.

#### Maps

A map feature was implemented for the marketplace to give users a visual representation on where the listing will be located. The map was implemented through using a geocoder gem and a Mapbox api. The geocoder gem extracts the longitude and latitude coordinates of the location that is inputted by the user. These coordinates are then parsed into the Mapbox api, which then generates a visual representation of the map. Users have the ability to navigate and scroll through the map.

### High Level Components of Application (Abstraction)

This marketplace application aims to provide users with a transparent platform where users can host a listing or join a listing. Users are given profiles which offer a bit of background information on the user. A user will also have the ability to get reviewed by other users or leave reviews themselves. The following are the high level components of the application:

1. Users

One of the components of the application is users. A user is an individual that signs up for the marketplace. A user may want to host an outdoor experience for other users to join, or a user can join outdoor experiences hosted by other users. A user can delete their account at anytime. A user can join many listings and host many listings.

2. Profile and Reviews

Each user is given a profile, a name, description and image can be provided. By having a profile page, users can gauge other users with the information provided on their profile page. A user can provide details on their hobbies and the type of outdoor activities that they enjoy. The aim of the profile is for users to find other like minded users to join them on different outdoor experiences. On the profile page, a review section is also provided. By providing a review page, users are given feedback on the experiences with other users.

3. Listing

The main attraction of the marketplace is its listings. Users are given the ability to host outdoor experiences where other users can join. In the listing, a title, description, image and location is provided for other users to view.

4. Bookings

Another component of the marketplace is a bookings section. This booking section allows users to book and attend listings by other hosts. Once a user is booked in for an experience, their names will become visable on the listing page. A user has the ability to make many bookings for many different experiences.

## Third Party Applications

#### Amazon Web Services (AWS)

For storage purposes, AWS was used for its cloud storage services. Amazon S3 is a cloud storage service which provides scalability, security, and performance. It is ideal for customers of all sizes, and provides all the necessary needs for this two way marketplace application. The main purpose for this storage service is to store images uploaded by users. These images include images for the outdoor listings as well as user profile images.

#### Mapbox

In order for users to be provided geographic information on the meetup point for the listing, a Mapbox api was implemented. Mapbox provides a graphical representation of where the listing will be located and takes an input of the longitude and latitude of the location. Users will need to just input the location name and the geocoder gem will extract the longitude and latitude of the destination and display it onto a map for users. By having a visual representation of an interactive map where users can scroll and move around, it will help users find a location without having to worry about getting lost.

#### Heroku

The deployment service that was implemented was Heroku. Heroku provides free-tier deployment for users for a limited amount of websites. Heroku supports Ruby and ruby on rails, hence making it easy and hassle free to deploy.

#### GitHub

Github was used as the remote repository for this marketplace. The project was developed using multiple branches on the local repository. Once the feature branch was complete, it will be merged to the main branch and the main branch will be pushed into GitHub. Through GitHub, other developers can access my marketplace and view my source code. Other developers can clone the marketplace application and add additional features to it. If they wish to add to the main branch, a pull request can be made.

### Entity Relational Diagram and Models

The marketplace application has five different models. These models include:

1. Users Model

The user model was generated by the devise gem. The user model consists of a user id which is the primary key, a email in the form of a string and an email in the form of a string. The user model serves as the primary model which all other models share an association with. A user has many reviewees indicating that a user can have many reviews made about that user, a user also has many reviewers indicating as a user you can leave many reviews for other users. If a user is destroyed, all associated reviews made by the user will be destroyed as well as the reviews on them.

A user can also create many listings and also join many other listings by other users via a booking. If a user is destroyed, all their bookings and listings will also be destroyed. A user has a one to one relationship with a profile, hence a user will only be allowed to have one profile. Devise also provides other criterion that needs to be met for a user to be created. This includes a password over 6 characters long and a unique email address that is non-existent on the marketplace database. The code snippet below shows the relationships of the user model.

```ruby
  has_many :reviewee, class_name: 'Review', foreign_key: "reviewee_id", dependent: :destroy
  has_many :reviewer, class_name: 'Review', foreign_key: "reviewer_id", dependent: :destroy
  has_many :listing, dependent: :destroy
  has_many :booking, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
```

2. Profile Model

The profile model was generated to provide information on the user. The profile model has attributes which include a profile id as its primary key, a first_name as a string, last_name as a string, a description as text and a user id which is the foreign key to link the profile to the correct user. When a user creates an account, they must input a first name and last name. These details will then be displayed on their profile page. A user will also have the option to upload one image as a profile picture. This image is not required and if a user chooses not to, then a default avatar image will be used. The profile belong to a user, because for a profile to be created, a user first must be created. The code snippet below shows the relationships of the profile model.

```ruby
  belongs_to :user
  has_one_attached :images
  validates :first_name, :last_name, presence: true
```

3. Reviews Model

A reviews model was generated to provide transparent information on users made by other users. The review model contains a review id as a primary key, a title as a string, a description as text, one reviewee id as a foreign key and one reviewer id as a foreign key. The review table has two foreign keys that connect to the same user table. This is because rather than creating two review tables one for writing reviews and another for receiving reviews, one table was used to simplify the database design. A user will be assigned a reviewee id and a reviewer id. In doing so, a user can review other users using the reviewer id and receive reviews through the reviewee id. In order to write a review, a user must include the title of the review along with the description of the review. The code snippet below shows the relationships of the review model.

```ruby
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewee, class_name: 'User'
  validates :title, :description, presence: true
```

4. Listings Model

A listing model was generated to provide users with the ability to create a listing and store information on that listing. A listing has a primary key of listing, a foreign key of host id, a title as a string, a description as text and a location as a string. A listing has one to many relationship with a user, as a user is allowed to make many listings but a booking can only have one user. A listing can also have many bookings. The primary key of the listing is used to link it to the bookings table through its foreign key. The foreign key host id in the listing table is used to link it to the user that created it through the users id.

A listing belongs to a user, hence a listing can only be available is a user exists and creates it. If a listing is destroyed, all its relevant bookings will also be destroyed. In order to create a listing, users must input the title of the listing, provide a description and location. It's optional for a user to attach a image, and the user has the ability to attach many images. The geocoder gem will derive the longitude and latitude of the location that is inputted by the user.

```ruby
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :images
  geocoded_by :location
  after_validation :geocode
  validates :title, :description, :location, presence: true
```

5. Bookings Model

A bookings model was generated to provide users with the ability to book a listing created by another host. The bookings model consists of three attributes: booking id, user id and listing id, which are all integers. The booking id is the primary key and the user id and listing id are foreign keys. A booking belongs to listing and users, hence a booking can only be created if a user exists and a listing exists. A user can create many bookings on many different listings.

```ruby
  belongs_to :user
  belongs_to :listing
```

![ERD](../ERD.png)
