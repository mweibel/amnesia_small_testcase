use Amnesia

defdatabase Database do

	deftable User, [:id, :name, :email], type: :ordered_set, index: [:email] do
		# defining it as "t" doesn't work anymore
		@type userT :: %User{id: non_neg_integer, name: String.t, email: String.t}

		def get_id_by_name_and_email(aname, aemail) do
			selector = where! name == aname and email == aemail, select: id

			case selector do
				nil ->
					nil
				_ ->
					selector |> Amnesia.Selection.values |> List.first
			end
		end
	end
end