Jobs = new Meteor.Collection(null)

if Meteor.isServer
  Meteor.methods githubJobs: () ->
    @unblock()
    githubjobs = Meteor.http.call "GET", "https://jobs.github.com/positions.json"

if Meteor.isClient
  Template.jobs.rendered = ->
    Jobs.remove({})
    githubjobs = Meteor.call "githubJobs", (error, results) ->
      if(error)
        console.log(error)
      else
        console.log(results)
        Jobs.insert job for job in results.data

  Template.jobs.helpers
    job:
      Jobs.find();
