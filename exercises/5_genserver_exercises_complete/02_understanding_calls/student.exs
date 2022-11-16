Code.compile_file("student.ex")

BuildingManager.start([])
result = BuildingManager.list_rooms()
IO.inspect(result, label: STUDENT_FILE)

# Add room
BuildingManager.add_room("Building 1", "Room 1", 10)
result = BuildingManager.list_rooms()
IO.inspect(result, label: STUDENT_FILE)

BuildingManager.add_room("Building 2", "Room 1", 20)
result = BuildingManager.list_rooms()
IO.inspect(result, label: STUDENT_FILE)
