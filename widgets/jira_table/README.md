# JIRA Kitto Plugin

Adds the ability to display lists of issues or a count of issues for filters from JIRA. The plugin is composed of 2 parts:

* JIRA Job - A Kitto job definition
* JIRA Table Widget - A Kitto widget for displaying JIRA issues in a table

## Installation

1. Install into your dashboard with `mix kitto.install --gist e2adb6e2f301672500d4b13e0a9a7de2`
2. Setup config/config.exs with the correct configuration variables:

  ```
  config :my_dashboard,
    jira_url: "https://example.atlassian.net",
    jira_username: "a valid JIRA username",
    jira_password: "the password for {JIRA_USERNAME}"
  ```
3. Update [`jira.exs#L4`](#file-jira-exs-L4) with the names and filter IDs of JIRA filters

## Use

The JIRA job defines 2 data sources for each filter: a list of issues and a count of the issues. The count data sources are compatible with the standard Kitto Number widget. The list data sources are built for the JiraTable widget.

### JIRA Table

To display the list of issues for a filter use the JiraTable widget in your dashboard:

```html
<div class="widget-jira"
     data-source="high_priority_list"
     data-widget="JiraTable"
     data-title="High Priority Issues"
     data-moreinfo="Blocker and Critical"></div>
```