# You are given a list of projects and a list of dependencies
# (which is a list of pairs of projects, where the second project
# is dependent on the first project). All of a project's dependencies
# must be built before the project is. Find a build order that will allow
# the projects to be built. If there is no valid build order, return
# an error.
#
# EXAMPLE
# Input:
#   projects: a, b, c, d, e, f
#   dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)
# Output: f, e, a, b, d, c


#thoughts
#make a tree where children are dependencies

#start from bottom, using dfs to determine heights

#i'm just gonna say that the projects are one letter strings




class Project

  attr_accessor :children, :parents

  def initialize(name)  
    @name = name
    @children = []
    @parents = []
  end

end


end
def build_order(projects, dependencies)
  #set up graph
  dependencies.each do |child, parent|
    child.parents.push(parent)
    parent.children.push(child)
  end
  #find starting project - one with no dependencies
  projects.each do |project|
    starter_project = project if project.parents.empty?
  end
  #doesn't work if everything has a dependency
  return 'impossibru' unless starter_project

  project_order = []

  project_queue = [starter_project]

  #kinda do bfs, except if current_project's parents isn't empty,
  #switch its position with the next project

  skips_made = 0
  until project_queue.empty?
    #if project has dependencies, skip it
    unless project_queue.first.parents.empty?
      project_queue.rotate!
      skips_made += 1
      return 'no bueno' if skips_made == project_queue.length
      next
    end

    skips_made = 0
    current_project = project_queue.shift
    project_order.push(current_project)

    current_project.children.each do |child|
      child.parents.delete(current_project)
    end

  end

  project_order
end





















end
