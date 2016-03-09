M1

1. Create a repo for our project (first thing's first)
2. Research the YouTube API, perhaps it will be helpful in some way to us.
3. Look for other API's or tools that could be in help.
4. According to the previous finds, decide whether or not we should use Ruby on Rails or just HTML, CSS, PHP and JavaScript / JQuery
5. Take part in the courses for PHP and JS (familiarize with the languages because we are going to need them for some forms)
6. Install XAMPP and configure it so we can setup a local database for our users and such.
7. Create a new database that is for logins and registrations with the following columns:
      - id (self-incremental, read-only, integer)
      - e-mail (string)
      - password (string, will be converted to hash in a future version)
      - type (integer)
              * 1 - Normal User
              * 2 - VIP User
              * 3 - Admin
      - join_date (date)
      - activated (boolean, true if the email is confirmed and false if not)
8. Create three accounts of each type using the query to understand the concept of SQL
9. Create a Login / Register page with no functionality to it just yet, just visually (HTML & CSS)

M2

1. Create the home page - use a bootstrap template to ease stuff (Contains some information about us and the concept of the project)
2. Create the hub page.
3. Add functionality to load a YouTube link (textbox or something)
4. Look for a way to embed our player, anything else than iframe ? (This step depends on the first 3 from milestone one)
5. Use the YouTube API to display additional information for the video and find a suitable place to display this (More Details button under the player maybe)
6. Add some buttons somewhere so the users can:
      - Like
      - Dislike
      - Add to playlist
      - Subscribe to the channel
      - Share to social media or automatically fetch a link to the clipboard
      - Report content
7. Add other login possibilities like G+ Twitter or Facebook

M3

1. Should've finished the player by now so it streams only audio and no video is loaded
2. Find a place for some ads to be shown
3. Limit the free users to 10 videos, then an advertisement is played and you have to wait so it finishes playing
4. VIP users see no advertisements at all
5. VIP users should be able to load a playlist instead only one video
6. Create a ticket form or something like that so all members can receive live support by staff.
7. Create the subscriptions page (pay monthly or purchase a lifetime subscription for our tool)
8. Add a first month free promotion if you link a credit card or a PayPal account.
9. Create a terms of use page with credits inside so we don't get sued by an accident.
