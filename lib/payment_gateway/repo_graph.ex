defmodule PaymentGateway.RepoGraph do
    alias Bolt.Sips, as: Neo
  
    def all do
      cypher = """
                MATCH (u:User)
                RETURN u.uid AS uid, u.name AS name
              """
      case Neo.query(Neo.conn(), cypher) do
        {:ok,  %Bolt.Sips.Response{results: results}} -> 
          results 
          |> Enum.map(fn user -> 
            %{
              name: user["name"]
            }
           end)
        {:error, response} -> response.message
      end
    end
  end
  