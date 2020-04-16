class Node
	attr_accessor :value, :next_node # Needed to access the attribute from the linkedlist class
	def initialize(value = nil, next_node = nil)
		@next_node = next_node
		@value = value
	end
end

class LinkedList
	def initialize
		@head = nil
	end

	def prepend(node)
		if @head != nil
			temp = @head
			@head = node
			node.next_node = temp
		else
			@head = node
		end
	end

	def append(node)
		if @head == nil
			@head = node # If there is no value at the head of the linkedlist then set the first node to it
		else
			previous_node = @head
			while true
				if previous_node.next_node == nil # If the previous node doesn't point to anything set it to point at the new node
					previous_node.next_node = node
					break
				else
					previous_node = previous_node.next_node # Keep trarversing the nodes until you come to the ned
				end
			end
		end	
	end	

	def size
		count = 0
		if @head == nil
			return 0
		else
			count += 1
			previous_node = @head
			current_node = previous_node.next_node
			while current_node != nil
				count += 1
				previous_node = current_node	
				current_node = previous_node.next_node
			end
		end
		return count
	end

	def head
		return @head
	end

	def tail
		if @head == nil
			return "There are no nodes!"
		else
			current_node = @head
			while current_node.next_node != nil
				current_node = current_node.next_node
			end
			return current_node
		end
	end

	def at(index)
		current_node = @head
		count = 1 # Index starts at 1
		while count != index
			current_node = current_node.next_node
			if current_node == nil
				return "Index is out of range!"
			else
				count += 1
			end
		end
		return current_node
	end

	def pop
		current_node = @head
		while current_node.next_node != nil
			prev_node = current_node
			current_node = current_node.next_node
		end
		prev_node.next_node = nil
	end
	
	def contains?(compare_value)
		current_node = @head
		found = false
		while (found == false) && (current_node != nil)
			if current_node.value == compare_value
				found = true
			else
				current_node = current_node.next_node
			end
		end
		return found
	end

	def find(compare_value)
		current_node = @head
		found = false
		count = 1
		while (found == false) && (current_node != nil) # Iterates until the value is found or we reach the end of the list and the current_node is nil
			if current_node.value == compare_value
				return count
			else
				current_node = current_node.next_node
				count += 1
			end
		end
		return "nil"
	end

	def to_s
		string = ""
		current_node = @head
		while current_node != nil
			string += " ( #{current_node.value} ) ->"
			current_node = current_node.next_node
		end
		string += " nil"
		return string
	end

	def insert_at(the_value, index)
		if index == 1
			temp = @head
			@head = Node.new(the_value)
			@head.next_node = temp

		else
			count = 1
			current_node = @head
			
			while count != index
				previous_node = current_node
				current_node = current_node.next_node
				count += 1
			end
			
			previous_node.next_node = Node.new(the_value)
			new_node = previous_node.next_node
			new_node.next_node = current_node
		end
	end

	def delete_at(index)
		if index == 1 # If they choose to remove the head
			current_node = @head
			next_node = current_node.next_node
			@head = next_node
		else
			count = 1
			current_node = @head
			
			while count != index
				previous_node = current_node
				current_node = current_node.next_node
				count += 1
			end
			previous_node.next_node = current_node.next_node
			current_node.next_node = nil
		end
	end
						

end

node1 = Node.new(6)
node2 = Node.new(8)
node3 = Node.new(12)

the_list = LinkedList.new
the_list.append(node1)
the_list.append(node2)
the_list.append(node3)
the_list.delete_at(2)
puts the_list.to_s