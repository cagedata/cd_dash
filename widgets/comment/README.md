# Comment Widget for Kitto

This package includes a widget for displaying comment style text in a dashboard.

## Install

1. Install into your dashboard with `mix kitto.install --gist ee402159c3c4770ee06f6e12a220cb35`
2. Create a job to export data with the following format:

  ```elixir
  %{
    name: "John Smith",
    screenName: "jsmith658",
    profilePic: "http://placehold.it/50x50",
    text: "Kitto is the best dashboard framework ever!"
  }
  ```