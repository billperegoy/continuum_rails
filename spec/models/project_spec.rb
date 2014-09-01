require 'spec_helper'

describe Project do
  it "can be created" do
    project = Project.new(name: "my_project", path: "my_path")
    expect(project.name).to eq("my_project")
    expect(project.path).to eq("my_path")
  end

  it "can be saved" do
    project = Project.create(name: "my_project", path: "my_path")
    expect(Project.count).to eq(1)
  end

  it "can be deleted" do
    project = Project.create(name: "my_project", path: "my_path")
    expect(Project.count).to eq(1)

    Project.delete(project.id)
    expect(Project.count).to eq(0)
  end

  it "can be updated" do
    project = Project.create(name: "my_project", path: "my_path")
    project.update(name: "new_project", path: "new_path")

    project_lookup = Project.find(project.id)
    expect(project_lookup.name).to eq("new_project")
    expect(project_lookup.path).to eq("new_path")
  end
end
