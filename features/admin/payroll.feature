Feature: Payroll report
  As an admin user
  I should be able to list unpaid work units for employees

  Scenario: List user with unpaid work unit
    Given I am an authenticated user with an "admin" role
    Given a user exist with first_name: "test", last_name: "man", email: "testman@example.com", password: "123456", password_confirmation: "123456"
    Given a client "Test Client" exist with name: "Test Client"
    Given a project "Test Project" exist with name: "Test Project", client: client "Test Client"
    Given a ticket "Test Ticket" exist with name: "Test Ticket", project: project "Test Project"
    Given a work_unit exist with description: "Test Work Unit", ticket: ticket "Test Ticket", hours: 1, scheduled_at: "2010-10-01 00:00:00", created_at: "2010-10-01 00:00:00", user: user
    When I go to the admin payroll index page
    Then I should see a link with text "man, test"

  Scenario: A user does not have any unpaid work units
    Given I am an authenticated user with an "admin" role
    Given a user exist with first_name: "bradley", last_name: "price", email: "bradley@isotope11.com", password: "123456", password_confirmation: "123456"
    Given a client "Test Client" exist with name: "Test Client"
    Given a project "Test Project" exist with name: "Test Project", client: client "Test Client"
    Given a ticket "Test Ticket" exist with name: "Test Ticket", project: project "Test Project"
    Given a work_unit exist with description: "Test Work Unit", ticket: ticket "Test Ticket", hours: 1, scheduled_at: "2010-10-01 00:00:00", created_at: "2010-10-01 00:00:00", paid_at: "2010-11-01 00:00:00", paid: "1234", user: user
    When I go to the admin payroll index page
    Then I should not see a link with text "price, bradley"
