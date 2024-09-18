ed_tb
    raise error, e, tb

# Change environ to automatically call putenv() if it exists
try:
    # This will fail if there's no putenv
    putenv
except NameError:
    pass
else:
    import UserDict

    # Fake unsetenv() for Windows
    # not sure about os2 here but
    # I'm guessing they are the same.

    if name in ('os2', 'nt'):
        def unsetenv(key):
            putenv(key, "")

    if name == "riscos":
        # On RISC OS, all env access goes through getenv and putenv
        from riscosenviron import _Environ
    elif name in ('os2', 'nt'):  # Where Env Var Names Must Be UPPERCASE
        # But we store them as upper case
        class _Environ(UserDict.IterableUserDict):
            def __init__(self, environ):
                UserDict.UserDict.__init__(self)
                data = self.data
                for k, v in environ.items():
                    data[k.upper()] = v
            def __setitem__(self, key, item):
                putenv(key, item)
                self.data[key.upper()] = item
            def __getitem__(self, key):
                return self.data[key.upper()]
            try:
                unsetenv
            except NameError:
                def __delitem__(self, key):
                    del self.data[key.upper()]
            else:
                def __delitem__(self, key):
                    unsetenv(key)
                    del self.data[key.upper()]
                def clear(self):
                    for key in self.data.keys():
                        unsetenv(key)
     