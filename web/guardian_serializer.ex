defmodule Exam1.GuardianSerializer do
  @behaviour Guardian.Serializer
  alias Exam1.{User,Repo}
  
  def for_token(%User{} = user), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown Resource"}
  def from_token("User:"<>user_id), do: {:ok, Repo.get(User, user_id)}
  def from_token(_), do: {:error, "Unknown Resource"}
end
