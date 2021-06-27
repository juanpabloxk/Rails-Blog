require 'ruby-graphviz'
require 'fileutils'
require 'tempfile'

module UsersHelper
  IMAGES_PATH = 'app/assets/images/'.freeze

  def self.internal_user_graph_path
    Rails.root.join IMAGES_PATH
  end

  def self.create_user_graph(user)
    g = GraphViz.new( :G, :type => :digraph )
    user_node = g.add_nodes("#{user.username}")
    user_node.set { |_n| _n.color = '#1976D2' }
    user.followers.each do |follower|
      follower_node = g.add_nodes("#{follower.username}")
      g.add_edges( follower_node, user_node )
    end
    user.followeds.each do |followed|
      followed_node = g.add_nodes("#{followed.username}")
      g.add_edges( user_node, followed_node )
    end
    file = Tempfile.new(['userimage','.svg'])
    g.output( :svg => file.path )
    file.read.html_safe
  end
end
