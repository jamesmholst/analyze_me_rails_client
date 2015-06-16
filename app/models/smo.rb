class Smo
	include Her::Model
	primary_key :smoid
	collection_path "users/:user_id/smos"
end