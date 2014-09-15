require 'spec_helper'

describe "displaying project list" do
  it "allows a project to be added and displayed" do
    visit projects_path
    expect(page).to have_content("New Project")
  end
end
