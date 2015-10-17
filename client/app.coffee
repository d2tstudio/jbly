Template.registerHelper "hasLoaded", (argument) ->
    Session.get "hasLoaded"

Template.jobs.rendered = ->
  console.log("loading")
  Session.set "hasLoaded", false

  Jobs.remove({})
  githubjobs = Meteor.call "githubJobs", (error, results) ->
    Session.set "hasLoaded", true
    if(error)
      console.log(error)
    else
      console.log("loaded" + results)
      Jobs.insert job for job in results.data

Template.jobs.helpers
  job:
    Jobs.find();
