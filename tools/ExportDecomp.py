# Ghidra headless post-script: export all decompiled functions + a listing.
# Usage (via analyzeHeadless): -postScript ExportDecomp.py <out_basepath>
from ghidra.app.decompiler import DecompInterface
from ghidra.util.task import ConsoleTaskMonitor

args = getScriptArgs()
base = args[0] if args else "sistrut_decomp"

di = DecompInterface()
di.openProgram(currentProgram)
mon = ConsoleTaskMonitor()
fm = currentProgram.getFunctionManager()

cfile = open(base + ".c", "w")
n = 0
for fn in fm.getFunctions(True):
    n += 1
    cfile.write("/* ===== %s @ %s  size=%d ===== */\n"
                % (fn.getName(), fn.getEntryPoint(), fn.getBody().getNumAddresses()))
    try:
        res = di.decompileFunction(fn, 90, mon)
        if res and res.decompileCompleted():
            cfile.write(res.getDecompiledFunction().getC())
        else:
            cfile.write("// decompile failed: %s\n"
                        % (res.getErrorMessage() if res else "no result"))
    except Exception as e:
        cfile.write("// exception: %s\n" % e)
    cfile.write("\n\n")
cfile.close()
print("ExportDecomp: wrote %d functions to %s.c" % (n, base))
