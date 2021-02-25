defmodule ImpowerElixir.HandleDb do

  def insert_data(mobile, token) do
    {:ok, conn} = Mongo.start_link(
      database: "impact",
      url: "mongodb+srv://admin:solace2020@cluster0-dzv45.mongodb.net/impact",
      username: "admin",
      password: "solace2020",
      pool_size: 5
      )

    data = Mongo.insert_one(conn, "users", %{MobileNo: mobile, token: token})
    {:ok, data}
  end

  def find_data(mobile, token) do
    {:ok, conn} = Mongo.start_link(
      database: "impact",
      url: "mongodb+srv://admin:solace2020@cluster0-dzv45.mongodb.net/impact",
      username: "admin",
      password: "solace2020",
      pool_size: 5
      )
    cursor = Mongo.find(conn, "users", %{MobileNo: mobile, token: token})
    {:ok , cursor.docs}

  end

  def show() do
    {:ok, conn} = Mongo.start_link(
      database: "impact",
      url: "mongodb+srv://admin:solace2020@cluster0-dzv45.mongodb.net/impact",
      username: "admin",
      password: "solace2020",
      pool_size: 5
      )


    cursor = Mongo.find(conn, "users", %{})

    cursor
    |> Enum.to_list()
  end

end
