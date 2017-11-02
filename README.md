# PhotoVow
## Description - Problem statement
When wedding planners organise weddings, one of the most crucial resources to arrange is a photographer for the event. There are commercial photographers established within the wedding industry but they are in high demand and command high prices.<br><br>
Competent hobbyist and enthusiast photographers motivated to work the occasional wedding in their spare time may not have the time to invest in the establishment of a full-time business and associated costs such as business websites and marketing.<br><br>
This site would give such photographers a platform to be exposed to the available wedding work and also to showcase their talent, allowing them to earn money from the skills they possess.<br><br>
The benefits for the wedding planner is the advertising of their wedding to a community of photographers who can apply and name their price, the wedding planner can then choose the right photographer for them given desired level of skill and budget.

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
- email
#### Portfolio
- bio: text
- user_id: User
- avatar_data: text  (shrine image)
- venue: string 
- city: string
- country: string

#### Photo
- image_data: text
- portfolio_id: Portfolio
- description: text

#### Listing
- owner_id: User
- title
- venue
- city
- country
- content: text
- date: date
- accepted_offer: Offer
- date_accepted: date

#### Offer
- photographer_id: User
- amount: decimal
- listing_id: Listing

#### Conversation
- sender_id: User
- recipient_id: User

#### Message
- author_id: User
- conversation_id: Conversation
- content: text
- time_read: time

#### Review
- author_id: User
- portfolio_id: Portfolio
- content: text
- rating: decimal

![erd](/readme-assets/erd.png)

### Wireframes

[The wireframe is available for viewing on figma](https://www.figma.com/file/UIzz6sN16w4vkLpuZxoFb7jj/Wedding-photography-site)

### Graphic Design

&lt;To be completed&gt;

## Notable issues or stuggles encountered along the way
