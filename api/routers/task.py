from fastapi import APIRouter
from api import schemas

router = APIRouter()

@router.get("/tasks", response_model=list[schemas.task.Task])
async def list_tasks():
    return [schemas.task.Task(id=1, title="1つ目のToDoタスク")]

@router.post("/tasks")
async def create_task():
    pass

@router.put("/tasks/{task_id}")
async def update_task():
    pass

@router.delete("/tasks/{task_id}")
async def delete_task():
    pass

