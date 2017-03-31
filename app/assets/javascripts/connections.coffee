# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@formatDate = ->
  d = new Date()
  curr_date = d.getDate()
  curr_month = d.getMonth() + 1 #Months are zero based
  curr_year = d.getFullYear()
  return padZeros(curr_year) + "-" + padZeros(curr_month) + "-" + padZeros(curr_date)

padZeros = (num) ->
  s = num + ""
  if s.length < 2
    s = "0" + s
  return s
