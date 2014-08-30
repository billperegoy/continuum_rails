require 'spec_helper'

describe Project do
  it "can be created" do
    project = Project.new(name: "my_project", path: "my_path")
    expect(project.name).to eq("my_project")
    expect(project.path).to eq("my_path")
  end
  
  it "can be craeted and saved" do
    project = Project.create(name: "my_project", path: "my_path")
    expect(Project.count).to eq(1)
  end
end
