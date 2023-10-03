from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from Algorithm import RegressionAlgo
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*']
)


@app.post("/feature/features")
async def Features_From_App(Brand, State, Cpu, Gen, CpuModel, ScreenRe, Memory, MemoryGen, Storage, StorageModel, Gpu, ScreenSize, GenWindows, Backlit):
    reslut = None
    try:
        file_path = "LinearRegressionModel.bin"
        if os.path.exists(file_path):
            reslut = RegressionAlgo(Brand, State, Cpu, Gen, CpuModel, ScreenRe, Memory, MemoryGen, Storage, StorageModel,
                                    Gpu, ScreenSize, GenWindows, Backlit)
        else:
            from Train_SaveModel import Train_Save_Model
            await Train_Save_Model()
            reslut = await RegressionAlgo(Brand, State, Cpu, Gen, CpuModel, ScreenRe,
                                    Memory, MemoryGen, Storage, StorageModel,
                                    Gpu, ScreenSize, GenWindows, Backlit)
    except:
        return "Error: Complete All Info ,Try Again):"
    return reslut
