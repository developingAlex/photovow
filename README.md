# PhotoVow
## Description
### Problem statement
When wedding planners organise weddings, one of the most crucial resources to arrange is a photographer for the event. There are commercial photographers established within the wedding industry but they are in high demand and command high prices.<br><br>
Competent hobbyist and enthusiast photographers motivated to work the occasional wedding in their spare time may not have the time to invest in the establishment of a full-time business and associated costs such as business websites and marketing.
### Solution
Make a 2-sided marketplace that would give such photographers a platform to be exposed to the available wedding work and also to showcase their talent, allowing them to earn money from the skills they possess.<br><br>
The benefits for the wedding planner is the advertising of their wedding to a community of photographers who can apply and name their price, the wedding planner can then choose the right photographer for them, given the desired level of skill and budget.

## Employed technologies
- Trello.com (Project planning, user stories, todo list, issue tracking)
- Figma.com (Wireframing)
- DbDesigner.net (Database modelling)
- Ruby on Rails (Development language)
- Rspec (Testing library)
- Postgresql (Database)
- Heroku (Deployment platform)
- Git (Version Control)
### Ruby Gems
- Devise gem (User sign in and authentication)
- Shrine (image uploading)
- dotenv (environment variable compartmentalisation (prevent sensitive info permeating source code that eventually ends up public on github))
## Planning
### User stories:

[User stories are publicly viewable on trello](https://trello.com/b/jZv2nvbp/wedding-photography-site) <br>
regardless below are some of them:

- In order to get the best price for my wedding photos, as a wedding planner, I want to see the lowest prices photographers will work for.
- In order to be reasonably confident the photographer I choose takes nice photos, as a wedding planner, I want to be able to view their past work.
- In order to earn money, as a photographer enthusiast/hobbyist with free-time, I want to be able to apply for work at upcoming weddings that are occurring when I have free time.
- In order to increase my chances of getting work to earn money, as a talented photographer, I want to be able to showcase my work to stand out from other photographers.

### Database tables / Models

#### User
- first_name
- last_name
- email (indexed automatically by devise)

#### Portfolio
- bio: text
- user_id: User (index this)
- avatar_data: text  (shrine image)
- city: string
- country: string

#### Photo
- image_data: text
- portfolio_id: Portfolio (index this)
- description: text

#### Listing
- owner_id: User (index this)
- title
- venue
- city
- country
- content: text
- date: date
- accepted_offer: integer (the id of the offer that is accepted, not a reference to avoid circular reference)
- date_accepted: date

#### Offer
- photographer_id: User (index this)
- amount: decimal
- listing_id: Listing (index this)

#### Conversation
- sender_id: User (indexed by default from the t.references line in the migration file)
- recipient_id: User (indexed by default from the t.references line in the migration file)

#### Message
- author_id: User (index this)
- conversation_id: Conversation (index this)
- content: text
- time_read: time

#### Review
- author_id: User (index this)
- portfolio_id: Portfolio (index this)
- content: text
- rating: decimal

![erd](/readme-assets/erd.png)

### Wireframes

[The wireframe is available for viewing on figma](https://www.figma.com/file/UIzz6sN16w4vkLpuZxoFb7jj/Wedding-photography-site)

### Graphic Design
#### splash image
I had a look on unsplash.com for some images to use on the sites splash page. 
I found the following bouquet photo which I thought would be suitable:<br>
![photo of a wedding bouquet](/readme-assets/unsplash1.jpg)<br>
There were many wedding photos available on that site but then I realised I wanted to emphasise the photography aspect, so then I looked for photography and camera related photos and saw this one:<br>
![photo of a camera showing the image being focused through the lens](/readme-assets/unsplash2.jpg)<br>
Then I had the thought of putting a wedding related photo into that cameras viewfinder and with some GIMP editing ended up with this:<br>
![photo of a camera showing the bouquet image edited in](/readme-assets/editedcameraimage.jpg)<br>

#### colour palette
I took advantage of the colorpicker in GIMP and the bouquet image to determine the exact colors appearing in the petals of the flowers:<br>
![colour palette creation](/readme-assets/palettedevelopment.jpg)<br>

Such colours have a soft look to them like pastels. throwing in two of the colours into colormind.io, locking them, and getting colormind to generate the others resulted in one set of colours that looked nice, and consisted of a range of contrasts which would be useful for the various elements of the site: Background, Typography, Borders, Buttons, Highlights etc.<br>
<br>
Below is the initial colour palette:<br> 
![initial colour palette](/readme-assets/initialpalette.jpg)<br>

## Notable issues or stuggles encountered along the way
1. I forgot to run the rails new command with --database=postgresql so had to do a second dummy take to get the right content for the database.yml file.
1. In creating the conversation model which has foreign keys to the users table, I initially named the references sender\_id and recipient\_id but this meant they were then becoming sender\_id\_id and recipient\_id\_id so renamed back to sender and recipient in the migration file.
1. I didn't realise that t.references lines in a migration file imply it will be indexing that column and initially added my own explicit line to add an index to those columns.
1. I attempted to scaffold the listing model before the offer model, and scaffold holds a reference to offer so had to undo it.
1. Realise my listing model refers to the offer model via the attribute accepted\_offer to capture which offer was accepted, and that my offer model refers to the listing model through its listing reference so it captures which listing the offer is about, and that that is a circular reference which is a bad state to have. Fixing by making the reference to accepted\_offer just an integer instead of a full working reference and will work around the issues of pulling up the appropriate offer manually.
1. Spend 10 minutes trying to figure out why my view wasn't being loaded when the route successfully directs to the correct controller action only to realise I had put the view .html.erb file in the wrong views folder (mistakenly put it in the rspec views folder)
1. Spend a few hours coding the logic behind determining if a user is making a new offer on a listing or revising their existing one, only to realise after looking into a routing issue that giving a model to a form makes the form smart enough to know that the submit button will then invoke a POST or PATCH depending on whether the object passed in is a new one or an existing one. That POST or PATCH can then be routed to the appropriate action. which is obvious as it's how scaffolding works out the box...
1. Realise after multiple routing errors that I was not going to succeed in the direction I was trying to go, possibly because I was not passing through two arguments to a nested resource in the 'apply' link of the listing show page. 
1. Realise that the routing error I was spending hours trying to tackle and multiple variations of syntax, was due to my form not being declared to be on two different models (which was neccessary because the models were nested.)
1. After half a day of struggling with Shrine to get it to work, and viewing over and over my instructors screen recording of the tutorial from when he went through it in class, I finally got the shrine image uploading to work and the issue was from an incorrect syntax in the __image_uploader.rb__ file. See this segment of code:
    ```
    def process(io, context)
      case context[:phase]
      when :store
        size_700 = resize_to_limit(io.download, 700, 700)
        size_500 = resize_to_limit(size_700, 500, 500)
        size_300 = resize_to_limit(size_500, 300, 300)
        thumb = resize_to_limit(size_300, 200, 200)
        { original: io, large: size_700, medium: size_500, small: size_300, thumb: thumb }
      end
    end
    ```
    because it was originally like this:
    ```
    def process(io, context)
      case context[:phase]
      when :store
        size_700 = resize_to_limit!(io.download, 700, 700)
        size_500 = resize_to_limit(size_700, 500, 500)
        size_300 = resize_to_limit(size_500, 300, 300)
        thumb = resize_to_limit!(size_300, 200, 200)
        { original: io, large: size_700, medium: size_500, small: size_300, thumb: thumb }
      end
    end
    ```
    Those extra exclamation marks were copy and paste errors.
    The error message I would get didn't hint that that was the cause, uploading of images appeared to function alright, but upon attempting to display the image on the page it was produce a rails error screen because the image_url tag wouldn't work or it would display an error similar to any of the following depending on the variation of syntax I would try to use:
      * `Unexpected token at '#<ActionDispatch::Http::UploadedFile:0x078...>`
      * `Undefined method 'image_url' for #....`
      * `Undefined method 'image_data' for ...`
      * No error produced, but attempt to display the image results in `#<ActionDispatch::Http::UploadedFile:0x078...>` being printed instead of an image being displayed.
1. In regards to the previous point, I verified it was working by testing with another test user account which did not yet have a portfolio picture, upon revisiting the original problematic test account the error still occurred when trying to update the portfolios image through the url .../portfolio/1/edit.
 `JSON::ParserError: 743: unexpected token at '#<ActionDispatch::Http::UploadedFile:0x007f4908044b30>'
`The issue must have been that the image stored in the portfolio model was corrupted by my previous attempts to upload an image. It's highly likely that this had something to do with the errors I was getting before, but the exclamation marks probably still needed correcting..
    * lesson learned: if at first you don't succeed, try again. If it's been two hours, recreate all data fresh, and restart all servers.
1. Realise that the layout I had defined in my figma would require a greater understanding of dealing with forms and mixing two different active records together so decided to go with the easiest option to get as much implemented by the deadline.
    * lesson learned: know more your capabilities and plan for deadlines.
1. Didn't realise the consequences of my decision to put the first\_name and last\_name attributes against the devise user model would impact my ability to give the user the ability to change them when they're editing their portfolio because I'm effectively wanting to give them the ability to edit aspects of two different models in the one form. A stackoverflow answer suggests using a method called accepts\_nested\_attributes\_for :othermodel in the model that the form is predominantly about. The issue I discovered with this approach is that validation fails because the attempt to update through the form results in an error notice that email and password can't be blank, so by incorporating some of the attributes from the user model, it then expected to get all the attributes for the user model. I tried to add the email and password as hidden fields in the form to see if that would do the trick but that didn't work because then the error message became "that email is already taken" as if it was attempting to create an entirely new user. I'm sure Devise has done some magic in that area and to provide some security (it seems dodgy putting a password in a hidden field) so at this point I think I will have to diverge from my wireframes again and direct the user to edit their first\_name and last\_name attributes through the forms provided by devise like to update their passwords or email address.
    * lesson learned: Don't try to partially mess with a model that is under the guise of Devise.