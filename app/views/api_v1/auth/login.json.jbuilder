json.auth_token @user.authentication_token
json.user_id @user.id
json.username @user.username
json.gender @user.gender
json.level @user.level
json.email @user.email
json.photo asset_url(@user.head.url)

json.teams do
  json.array!(@user.teams) do |team|
    json.id team.id
    json.name team.name
    json.start_time_hour "%02d" %team.start_time.hour
    json.start_time_min "%02d" %team.start_time.min
    json.end_time_hour "%02d" %team.end_time.hour
    json.end_time_min "%02d" %team.end_time.min
    json.day team.day
    json.location team.location
    json.teammembers team.users
    json.logo_original_url asset_url(team.logo.url)
  end
end
