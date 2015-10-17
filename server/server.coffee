Meteor.methods githubJobs: () ->
  @unblock()
  githubjobs = Meteor.http.call "GET", "https://jobs.github.com/positions.json"
