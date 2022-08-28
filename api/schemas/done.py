from pydantic import BaseModel


class DoneResponse(BaseModel):
    id: int

    class config:
        orm_mode = True
