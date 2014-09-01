require 'spec_helper'

describe Release do

  it "creates and starts a level 0 regression when created" do
    project_name = "my_proj"
    project = Project.create(name: project_name, path: "my_path")
    stage0 = Stage.create(name: "stage0", level: 0, project_id: project.id)

    release = Release.create(project_id: project.id, git_id: "git_id0")
    expect(Release.count).to eq(1)
  end
end
