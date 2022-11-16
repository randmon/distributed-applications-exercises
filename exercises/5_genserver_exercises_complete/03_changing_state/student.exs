Code.compile_file("student.ex")

BuildingManager.start([])
result = BuildingManager.list_rooms()
IO.inspect(result, label: STUDENT_FILE)
