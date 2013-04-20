
## Models
======

User
----

* has_many :votes

Place
-----

* name
* url
* added_by

Poll
----

* has_many :votes
* has_many :polloptions
* name
* started_by

PollOption
----------

* belongs_to :poll
* poll_id
* place_id

Vote
----

* belongs_to :poll, through: :polloption
* belongs_to :user
* user_id
* polloption_id



