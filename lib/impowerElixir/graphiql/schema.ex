defmodule ImpowerElixir.GraphQL.Schema do

  use Absinthe.Schema
  import Ecto.Query, warn: false
  alias ImpowerElixir.{
    Users,
    Repo,
    HandleDb,
    Token
  }

  object :users do
    field :mobile, :string
    field :token, :integer
  end
  object :validate_users do
    field :success, :boolean
  end

  query do
    field :users, list_of(:users) do
      resolve fn(_args, _context) ->
        users = ImpowerElixir.HandleDb.show()
        {:ok, users }
      end
    end
  end

  mutation do
    field :create_users, :validate_users do
      arg :mobile, non_null(:string)

      resolve fn(%{mobile: mobile}, _context) ->
        user_token = ImpowerElixir.Id.token
        users = ImpowerElixir.HandleDb.insert_data(mobile, user_token)
        case users do
          {:ok, _} ->
            {:ok, %{success: true}}
          {:error , _} ->
            {:ok, %{success: false}}
        end
      end
    end
    field :vaildate_users, :validate_users do
      arg :mobile, non_null(:string)
      arg :token, non_null(:integer)
      resolve fn(%{mobile: mobile , token: token}, _context) ->
        # result = (
        # from u in Users,
        # where: u.mobile == ^mobile,
        # where: u.token == ^token)
        # |> Repo.one()
        {:ok , result} = ImpowerElixir.HandleDb.find_data(mobile, token)
        case result do
          [] ->
            {:ok, %{success: false}}

          _ ->
            {:ok,%{success: true}}
        end



      end
    end

  end
end
