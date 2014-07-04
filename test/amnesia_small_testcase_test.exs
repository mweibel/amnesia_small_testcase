defmodule AmnesiaSmallTestcaseTest do
	use ExUnit.Case
	use Amnesia

	setup_all do
		Mix.Task.run("installDb")
		Amnesia.start

		Database.wait

		on_exit fn ->
			Amnesia.stop
		end

		:ok
	end

	test "test from the outside" do
		use Database.User
		selector = Database.User.where! name == "test" and email == "test@example.com",
			select: id

		value = selector |> Amnesia.Selection.values |> List.first
		assert 1 == value
	end

	test "get inserted user" do
		res = Database.User.get_id_by_name_and_email("test", "test@example.com")
		assert 1 == res
	end

	test "get non existing user" do
		res = Database.User.get_id_by_name_and_email("aa", "bb@example.com")
		assert nil == res
	end
end
