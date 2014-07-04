defmodule Mix.Tasks.InstallDb do
	use Mix.Task
	use Amnesia

	@shortdoc "Installs mnesia database"

	@moduledoc """
	Uses amnesia to create our custom database
	"""
	def run(_) do
		Amnesia.Schema.create
		Amnesia.start

		Database.User.create disk: [node]

		Database.wait

		Amnesia.transaction do
			%Database.User{
				id: 1,
				name: "test",
				email: "test@example.com"
			} |> Database.User.write
		end

		Amnesia.stop

		:ok
	end
end