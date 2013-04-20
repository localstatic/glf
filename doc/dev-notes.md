
User
----
* has_many :votes

Poll
----
* has_many :votes
* has_many :polloptions

PollOption
----------
* belongs_to :poll
* place name

Vote
----
* belongs_to :poll
* belongs_to :user


