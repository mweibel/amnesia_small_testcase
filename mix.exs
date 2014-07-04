defmodule AmnesiaIssue_19.Mixfile do
	use Mix.Project

	def project do
		[app: :amnesia_issue_19,
		 version: "0.0.1",
		 elixir: "~> 0.14.1",
		 deps: deps]
	end

	# Configuration for the OTP application
	#
	# Type `mix help compile.app` for more information
	def application do
		[
			applications: [ :amnesia ],
			mod: {AmnesiaIssue_19, []}
		]
	end

	# Dependencies can be hex.pm packages:
	#
	#   {:mydep, "~> 0.3.0"}
	#
	# Or git/path repositories:
	#
	#   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
	#
	# Type `mix help deps` for more examples and options
	defp deps do
		[
			{:amnesia, [github: "meh/amnesia"]}
		]
	end
end
