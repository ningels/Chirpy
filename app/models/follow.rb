class Follow < Socialization::ActiveRecordStores::Follow
  belongs_to :follower, class_name: "User"
  belongs_to :followable, class_name: "User"
end
