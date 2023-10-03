import pickle

file_model_name = 'LinearRegressionModel.bin'
def RegressionAlgo(Brand, State, Cpu, Gen, CpuModel, ScreenRe, Memory, MemoryGen, Storage, StorageModel, Gpu, ScreenSize, GenWindows, Backlit):    
    if State == "New":
        State = 1
    else:
        State = 0
    Cpu = int(Cpu.replace("Core i", ""))
    Gen = int(Gen)

    if CpuModel == "H":
        CpuModel = 0
    else:
        CpuModel = 1

    if ScreenRe == "HD":
        ScreenRe = 0
    elif ScreenRe == "FHD":
        ScreenRe = 1
    elif ScreenRe == "QHD":
        ScreenRe = 2
    else:
        ScreenRe = 1

    Memory = int(Memory.replace("GB", ""))
    MemoryGen = int(MemoryGen.replace("DDR", ""))
    Storage = int(Storage.replace("1TB", "1024").replace("GB", ""))

    if StorageModel == "SSD":
        StorageModel = 1
    else:
        StorageModel = 0

    Gpu = int(Gpu.replace("RTX", "").replace(
        "GTX", "").replace("Built-in", "100").replace("MX", ""))
    ScreenSize = float(ScreenSize)

    if GenWindows == "Yes":
        GenWindows = 1
    else:
        GenWindows = 0

    if Backlit == "Yes":
        Backlit = 1
    else:
        Backlit = 0
    # pickle.dump(lm, open(filename, 'wb'))
    loaded_model = pickle.load(open(file_model_name, 'rb'))
    y_pred = loaded_model.predict([[State, Cpu, Gen, CpuModel, ScreenRe, Memory, MemoryGen,
                                    Storage, StorageModel, Gpu, ScreenSize, GenWindows, Backlit]])
    # print(y_pred)
    return int(y_pred)
