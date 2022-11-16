Code.compile_file("student.ex")

BuildingManager.start([])
result = BuildingManager.list_rooms_manual_implementation()
IO.inspect(result, label: STUDENT_FILE)
