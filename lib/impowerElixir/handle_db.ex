defmodule ImpowerElixir.HandleDb do

  def insert_data(mobile, token) do
    {:ok, conn} = Mongo.start_link(
      database: "impact",
      url: "mongodb+srv://admin:solace2020@cluster0-dzv45.mongodb.net/impact",
      username: "admin",
      password: "solace2020",
      pool_size: 5
      )


    data = Mongo.insert_one(conn, "user", %{MobileNo: mobile, token: token})
    IO.puts "here is data"
    IO.inspect data
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
    cursor = Mongo.find(conn, "user", %{MobileNo: mobile, token: token})
    # IO.inspect cursor.docs
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


    cursor = Mongo.find(conn, "user", %{})

    cursor
    |> Enum.to_list()
  end

end
