tion string %r: "
                    "must be at least two characters long" % opt, self)
            elif len(opt) == 2:
                if not (opt[0] == "-" and opt[1] != "-"):
                    raise OptionError(
                        "invalid short option string %r: "
                        "must be of the form -x, (x any non-dash char)" % opt,
                        self)
                self._short_opts.append(opt)
            else:
                if not (opt[0:2] == "--" and opt[2] != "-"):
                    raise OptionError(
                        "invalid long option string %r: "
                        "must start with --, followed by non-dash" % opt,
                        self)
                self._long_opts.append(opt)

    def _set_attrs(self, attrs):
        for attr in self.ATTRS:
            if attr in attrs:
                setattr(self, attr, attrs[attr])
                del attrs[attr]
            else:
                if attr == 'default':
                    setattr(self, attr, NO_DEFAULT)
                else:
                    setattr(self, attr, None)
        if attrs:
            attrs = attrs.keys()
            attrs.sort()
            raise OptionError(
                "invalid keyword arguments: %s" % ", ".join(attrs),
                self)


    # -- Constructor validation methods --------------------------------

    def _check_action(self):
        if self.action is None:
            self.action = "store"
        elif self.action not in self.ACTIONS:
            raise OptionError("invalid action: %r" % self.action, self)

    def _check_type(self):
        if self.type is None:
            if self.action in self.ALWAYS_TYPED_ACTIONS:
                if self.choices is not None:
                    # The "choices" attribute implies "choice" type.
                    self.type = "choice"
                else:
                    # No type given?  "string" is the most sensible default.
                    self.type = "string"
        else:
            # Allow type objects or builtin type conversion functions
            # (int, str, etc.) as an alternative to their names.  (The
         