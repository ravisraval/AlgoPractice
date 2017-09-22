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
#make a tree where children are dependencies - they need parents first
#start from bottom, using dfs to determine heights
#i'm just gonna say that the projects are one letter strings
class Project

  attr_accessor :children, :parents
  attr_reader :name

  def initialize(name)
    @name = name
    @children = []
    @parents = []
  end

end

def build_order(projects, dependencies)
  #set up graph
  dependencies.each do |parent, child|
    child.parents.push(parent)
    parent.children.push(child)
  end

  #find starting project - one with no dependencies

  project_queue = []
  projects.each do |project|
    project_queue.push(project) if project.parents.empty?
  end
  #doesn't work if everything has a dependency
  return 'impossibru' if project_queue.empty?

  project_order = []

  #kinda do bfs, except if current_project's parents isn't empty,
  #switch its position with the next project, pushing it ahead in the queue

  skips_made = 0
  until project_queue.empty?
    #if project has dependencies, skip it
    #if we've skipped everything, then we're in a loop. can't work
    unless project_queue.first.parents.empty?
      project_queue.rotate!
      skips_made += 1
      return 'no bueno' if skips_made == project_queue.length
      next
    end

    skips_made = 0
    current_project = project_queue.shift
    project_order.push(current_project.name)

    current_project.children.each do |child|
      child.parents.delete(current_project)
      project_queue.push(child) unless project_queue.include?(child)
    end

  end

  project_order
end



a = Project.new("a")
b = Project.new("b")
c = Project.new("c")
d = Project.new("d")
e = Project.new("e")
f = Project.new("f")
# g = Project.new("g")
projects = [a, b, c, d, e, f]
dependencies = [ [a, d], [f, b], [b, d], [f, a], [d, c] ]

p build_order(projects, dependencies)
