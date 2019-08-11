(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i64)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;7;) (func))
  (type (;8;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32)))
  (type (;10;) (func (result i32)))
  (type (;11;) (func (param f64 i32) (result f64)))
  (import "wasi_unstable" "fd_prestat_get" (func $__wasi_fd_prestat_get (type 2)))
  (import "wasi_unstable" "fd_prestat_dir_name" (func $__wasi_fd_prestat_dir_name (type 0)))
  (import "wasi_unstable" "environ_sizes_get" (func $__wasi_environ_sizes_get (type 2)))
  (import "wasi_unstable" "environ_get" (func $__wasi_environ_get (type 2)))
  (import "wasi_unstable" "args_sizes_get" (func $__wasi_args_sizes_get (type 2)))
  (import "wasi_unstable" "args_get" (func $__wasi_args_get (type 2)))
  (import "wasi_unstable" "proc_exit" (func $__wasi_proc_exit (type 3)))
  (import "wasi_unstable" "fd_fdstat_get" (func $__wasi_fd_fdstat_get (type 2)))
  (import "wasi_unstable" "fd_close" (func $__wasi_fd_close (type 4)))
  (import "wasi_unstable" "fd_seek" (func $__wasi_fd_seek (type 5)))
  (import "wasi_unstable" "fd_write" (func $__wasi_fd_write (type 6)))
  (func $__wasm_call_ctors (type 7))
  (func $_start (type 7)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call $__wasilibc_init_preopen
    i32.const 3
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              local.get 0
              call $__wasi_fd_prestat_get
              local.tee 2
              i32.const 8
              i32.eq
              br_if 1 (;@4;)
              local.get 2
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.add
                call $malloc
                local.tee 2
                i32.eqz
                br_if 4 (;@2;)
                local.get 1
                local.get 2
                local.get 0
                i32.load offset=4
                call $__wasi_fd_prestat_dir_name
                br_if 3 (;@3;)
                local.get 2
                local.get 0
                i32.load offset=4
                i32.add
                i32.const 0
                i32.store8
                local.get 1
                local.get 2
                call $__wasilibc_register_preopened_fd
                local.set 3
                local.get 2
                call $free
                local.get 3
                br_if 4 (;@2;)
              end
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            local.get 0
            local.get 0
            i32.const 12
            i32.add
            call $__wasi_environ_sizes_get
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.load
            i32.const 2
            i32.shl
            i32.const 4
            i32.add
            call $malloc
            i32.store offset=3912
            local.get 0
            i32.load offset=12
            call $malloc
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=3912
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 0
            i32.load
            i32.const 2
            i32.shl
            i32.add
            i32.const 0
            i32.store
            i32.const 0
            i32.load offset=3912
            local.get 1
            call $__wasi_environ_get
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 12
                  i32.add
                  local.get 0
                  call $__wasi_args_sizes_get
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=12
                  local.tee 1
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.const 4
                  i32.add
                  call $malloc
                  local.set 1
                  local.get 0
                  i32.load
                  call $malloc
                  local.set 2
                  local.get 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 2
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 0
                  i32.store
                  local.get 1
                  local.get 2
                  call $__wasi_args_get
                  i32.eqz
                  br_if 2 (;@5;)
                end
                i32.const 71
                call $_Exit
                unreachable
              end
            end
            call $__wasm_call_ctors
            local.get 0
            i32.load offset=12
            local.get 1
            call $main
            local.set 1
            call $__prepare_for_exit
            local.get 1
            br_if 3 (;@1;)
            local.get 0
            i32.const 16
            i32.add
            global.set 0
            return
          end
          i32.const 71
          call $_Exit
          unreachable
        end
        local.get 2
        call $free
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    local.get 1
    call $_Exit
    unreachable)
  (func $main (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set 0
    i32.const 0
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=12
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=4
    i32.const 0
    local.set 6
    local.get 6
    i32.load offset=1040
    local.set 7
    i32.const 1024
    local.set 8
    i32.const 0
    local.set 9
    local.get 7
    local.get 8
    local.get 9
    call $fprintf
    drop
    i32.const 0
    local.set 10
    i32.const 16
    local.set 11
    local.get 4
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set 0
    local.get 10
    return)
  (func $malloc (type 4) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                local.get 0
                                                                                i32.const 244
                                                                                i32.gt_u
                                                                                br_if 0 (;@38;)
                                                                                i32.const 0
                                                                                i32.load offset=3408
                                                                                local.tee 2
                                                                                i32.const 16
                                                                                local.get 0
                                                                                i32.const 11
                                                                                i32.add
                                                                                i32.const -8
                                                                                i32.and
                                                                                local.get 0
                                                                                i32.const 11
                                                                                i32.lt_u
                                                                                select
                                                                                local.tee 3
                                                                                i32.const 3
                                                                                i32.shr_u
                                                                                local.tee 4
                                                                                i32.shr_u
                                                                                local.tee 0
                                                                                i32.const 3
                                                                                i32.and
                                                                                i32.eqz
                                                                                br_if 1 (;@37;)
                                                                                local.get 0
                                                                                i32.const -1
                                                                                i32.xor
                                                                                i32.const 1
                                                                                i32.and
                                                                                local.get 4
                                                                                i32.add
                                                                                local.tee 5
                                                                                i32.const 3
                                                                                i32.shl
                                                                                local.tee 6
                                                                                i32.const 3456
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 4
                                                                                i32.const 8
                                                                                i32.add
                                                                                local.set 0
                                                                                local.get 4
                                                                                i32.load offset=8
                                                                                local.tee 3
                                                                                local.get 6
                                                                                i32.const 3448
                                                                                i32.add
                                                                                local.tee 6
                                                                                i32.eq
                                                                                br_if 2 (;@36;)
                                                                                local.get 3
                                                                                local.get 6
                                                                                i32.store offset=12
                                                                                local.get 6
                                                                                i32.const 8
                                                                                i32.add
                                                                                local.get 3
                                                                                i32.store
                                                                                br 3 (;@35;)
                                                                              end
                                                                              i32.const -1
                                                                              local.set 3
                                                                              local.get 0
                                                                              i32.const -65
                                                                              i32.gt_u
                                                                              br_if 14 (;@23;)
                                                                              local.get 0
                                                                              i32.const 11
                                                                              i32.add
                                                                              local.tee 0
                                                                              i32.const -8
                                                                              i32.and
                                                                              local.set 3
                                                                              i32.const 0
                                                                              i32.load offset=3412
                                                                              local.tee 7
                                                                              i32.eqz
                                                                              br_if 14 (;@23;)
                                                                              i32.const 0
                                                                              local.set 8
                                                                              block  ;; label = @38
                                                                                local.get 0
                                                                                i32.const 8
                                                                                i32.shr_u
                                                                                local.tee 0
                                                                                i32.eqz
                                                                                br_if 0 (;@38;)
                                                                                i32.const 31
                                                                                local.set 8
                                                                                local.get 3
                                                                                i32.const 16777215
                                                                                i32.gt_u
                                                                                br_if 0 (;@38;)
                                                                                local.get 3
                                                                                i32.const 14
                                                                                local.get 0
                                                                                local.get 0
                                                                                i32.const 1048320
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 8
                                                                                i32.and
                                                                                local.tee 4
                                                                                i32.shl
                                                                                local.tee 0
                                                                                i32.const 520192
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 4
                                                                                i32.and
                                                                                local.tee 5
                                                                                local.get 4
                                                                                i32.or
                                                                                local.get 0
                                                                                local.get 5
                                                                                i32.shl
                                                                                local.tee 0
                                                                                i32.const 245760
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 2
                                                                                i32.and
                                                                                local.tee 4
                                                                                i32.or
                                                                                i32.sub
                                                                                local.get 0
                                                                                local.get 4
                                                                                i32.shl
                                                                                i32.const 15
                                                                                i32.shr_u
                                                                                i32.add
                                                                                local.tee 0
                                                                                i32.const 7
                                                                                i32.add
                                                                                i32.shr_u
                                                                                i32.const 1
                                                                                i32.and
                                                                                local.get 0
                                                                                i32.const 1
                                                                                i32.shl
                                                                                i32.or
                                                                                local.set 8
                                                                              end
                                                                              i32.const 0
                                                                              local.get 3
                                                                              i32.sub
                                                                              local.set 5
                                                                              local.get 8
                                                                              i32.const 2
                                                                              i32.shl
                                                                              i32.const 3712
                                                                              i32.add
                                                                              i32.load
                                                                              local.tee 4
                                                                              i32.eqz
                                                                              br_if 3 (;@34;)
                                                                              local.get 3
                                                                              i32.const 0
                                                                              i32.const 25
                                                                              local.get 8
                                                                              i32.const 1
                                                                              i32.shr_u
                                                                              i32.sub
                                                                              local.get 8
                                                                              i32.const 31
                                                                              i32.eq
                                                                              select
                                                                              i32.shl
                                                                              local.set 6
                                                                              i32.const 0
                                                                              local.set 0
                                                                              i32.const 0
                                                                              local.set 9
                                                                              loop  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  local.get 4
                                                                                  i32.load offset=4
                                                                                  i32.const -8
                                                                                  i32.and
                                                                                  local.get 3
                                                                                  i32.sub
                                                                                  local.tee 2
                                                                                  local.get 5
                                                                                  i32.ge_u
                                                                                  br_if 0 (;@39;)
                                                                                  local.get 2
                                                                                  local.set 5
                                                                                  local.get 4
                                                                                  local.set 9
                                                                                  local.get 2
                                                                                  i32.eqz
                                                                                  br_if 8 (;@31;)
                                                                                end
                                                                                local.get 0
                                                                                local.get 4
                                                                                i32.const 20
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 2
                                                                                local.get 2
                                                                                local.get 4
                                                                                local.get 6
                                                                                i32.const 29
                                                                                i32.shr_u
                                                                                i32.const 4
                                                                                i32.and
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 4
                                                                                i32.eq
                                                                                select
                                                                                local.get 0
                                                                                local.get 2
                                                                                select
                                                                                local.set 0
                                                                                local.get 6
                                                                                local.get 4
                                                                                i32.const 0
                                                                                i32.ne
                                                                                i32.shl
                                                                                local.set 6
                                                                                local.get 4
                                                                                br_if 0 (;@38;)
                                                                              end
                                                                              local.get 0
                                                                              local.get 9
                                                                              i32.or
                                                                              i32.eqz
                                                                              br_if 4 (;@33;)
                                                                              br 11 (;@26;)
                                                                            end
                                                                            local.get 3
                                                                            i32.const 0
                                                                            i32.load offset=3416
                                                                            local.tee 7
                                                                            i32.le_u
                                                                            br_if 13 (;@23;)
                                                                            local.get 0
                                                                            i32.eqz
                                                                            br_if 4 (;@32;)
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shl
                                                                            i32.const 2
                                                                            local.get 4
                                                                            i32.shl
                                                                            local.tee 0
                                                                            i32.const 0
                                                                            local.get 0
                                                                            i32.sub
                                                                            i32.or
                                                                            i32.and
                                                                            local.tee 0
                                                                            i32.const 0
                                                                            local.get 0
                                                                            i32.sub
                                                                            i32.and
                                                                            i32.const -1
                                                                            i32.add
                                                                            local.tee 0
                                                                            local.get 0
                                                                            i32.const 12
                                                                            i32.shr_u
                                                                            i32.const 16
                                                                            i32.and
                                                                            local.tee 0
                                                                            i32.shr_u
                                                                            local.tee 4
                                                                            i32.const 5
                                                                            i32.shr_u
                                                                            i32.const 8
                                                                            i32.and
                                                                            local.tee 5
                                                                            local.get 0
                                                                            i32.or
                                                                            local.get 4
                                                                            local.get 5
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 2
                                                                            i32.shr_u
                                                                            i32.const 4
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 1
                                                                            i32.shr_u
                                                                            i32.const 2
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 1
                                                                            i32.shr_u
                                                                            i32.const 1
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            i32.add
                                                                            local.tee 5
                                                                            i32.const 3
                                                                            i32.shl
                                                                            local.tee 6
                                                                            i32.const 3456
                                                                            i32.add
                                                                            i32.load
                                                                            local.tee 4
                                                                            i32.load offset=8
                                                                            local.tee 0
                                                                            local.get 6
                                                                            i32.const 3448
                                                                            i32.add
                                                                            local.tee 6
                                                                            i32.eq
                                                                            br_if 6 (;@30;)
                                                                            local.get 0
                                                                            local.get 6
                                                                            i32.store offset=12
                                                                            local.get 6
                                                                            i32.const 8
                                                                            i32.add
                                                                            local.get 0
                                                                            i32.store
                                                                            br 7 (;@29;)
                                                                          end
                                                                          i32.const 0
                                                                          local.get 2
                                                                          i32.const -2
                                                                          local.get 5
                                                                          i32.rotl
                                                                          i32.and
                                                                          i32.store offset=3408
                                                                        end
                                                                        local.get 4
                                                                        local.get 5
                                                                        i32.const 3
                                                                        i32.shl
                                                                        local.tee 5
                                                                        i32.const 3
                                                                        i32.or
                                                                        i32.store offset=4
                                                                        local.get 4
                                                                        local.get 5
                                                                        i32.add
                                                                        local.tee 4
                                                                        local.get 4
                                                                        i32.load offset=4
                                                                        i32.const 1
                                                                        i32.or
                                                                        i32.store offset=4
                                                                        br 33 (;@1;)
                                                                      end
                                                                      i32.const 0
                                                                      local.set 0
                                                                      i32.const 0
                                                                      local.set 9
                                                                      i32.const 0
                                                                      i32.const 0
                                                                      i32.or
                                                                      br_if 7 (;@26;)
                                                                    end
                                                                    i32.const 2
                                                                    local.get 8
                                                                    i32.shl
                                                                    local.tee 0
                                                                    i32.const 0
                                                                    local.get 0
                                                                    i32.sub
                                                                    i32.or
                                                                    local.get 7
                                                                    i32.and
                                                                    local.tee 0
                                                                    i32.eqz
                                                                    br_if 9 (;@23;)
                                                                    local.get 0
                                                                    i32.const 0
                                                                    local.get 0
                                                                    i32.sub
                                                                    i32.and
                                                                    i32.const -1
                                                                    i32.add
                                                                    local.tee 0
                                                                    local.get 0
                                                                    i32.const 12
                                                                    i32.shr_u
                                                                    i32.const 16
                                                                    i32.and
                                                                    local.tee 0
                                                                    i32.shr_u
                                                                    local.tee 4
                                                                    i32.const 5
                                                                    i32.shr_u
                                                                    i32.const 8
                                                                    i32.and
                                                                    local.tee 6
                                                                    local.get 0
                                                                    i32.or
                                                                    local.get 4
                                                                    local.get 6
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 2
                                                                    i32.shr_u
                                                                    i32.const 4
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 1
                                                                    i32.shr_u
                                                                    i32.const 2
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 1
                                                                    i32.shr_u
                                                                    i32.const 1
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    i32.add
                                                                    i32.const 2
                                                                    i32.shl
                                                                    i32.const 3712
                                                                    i32.add
                                                                    i32.load
                                                                    local.tee 0
                                                                    br_if 7 (;@25;)
                                                                    br 8 (;@24;)
                                                                  end
                                                                  i32.const 0
                                                                  i32.load offset=3412
                                                                  local.tee 10
                                                                  i32.eqz
                                                                  br_if 8 (;@23;)
                                                                  local.get 10
                                                                  i32.const 0
                                                                  local.get 10
                                                                  i32.sub
                                                                  i32.and
                                                                  i32.const -1
                                                                  i32.add
                                                                  local.tee 0
                                                                  local.get 0
                                                                  i32.const 12
                                                                  i32.shr_u
                                                                  i32.const 16
                                                                  i32.and
                                                                  local.tee 0
                                                                  i32.shr_u
                                                                  local.tee 4
                                                                  i32.const 5
                                                                  i32.shr_u
                                                                  i32.const 8
                                                                  i32.and
                                                                  local.tee 5
                                                                  local.get 0
                                                                  i32.or
                                                                  local.get 4
                                                                  local.get 5
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 2
                                                                  i32.shr_u
                                                                  i32.const 4
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 1
                                                                  i32.shr_u
                                                                  i32.const 2
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 1
                                                                  i32.shr_u
                                                                  i32.const 1
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  i32.add
                                                                  i32.const 2
                                                                  i32.shl
                                                                  i32.const 3712
                                                                  i32.add
                                                                  i32.load
                                                                  local.tee 6
                                                                  i32.load offset=4
                                                                  i32.const -8
                                                                  i32.and
                                                                  local.get 3
                                                                  i32.sub
                                                                  local.set 5
                                                                  local.get 6
                                                                  local.tee 9
                                                                  i32.load offset=16
                                                                  local.tee 0
                                                                  i32.eqz
                                                                  br_if 3 (;@28;)
                                                                  i32.const 1
                                                                  local.set 4
                                                                  br 4 (;@27;)
                                                                end
                                                                i32.const 0
                                                                local.set 5
                                                                local.get 4
                                                                local.set 9
                                                                local.get 4
                                                                local.set 0
                                                                br 5 (;@25;)
                                                              end
                                                              i32.const 0
                                                              local.get 2
                                                              i32.const -2
                                                              local.get 5
                                                              i32.rotl
                                                              i32.and
                                                              local.tee 2
                                                              i32.store offset=3408
                                                            end
                                                            local.get 4
                                                            i32.const 8
                                                            i32.add
                                                            local.set 0
                                                            local.get 4
                                                            local.get 3
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 4
                                                            local.get 5
                                                            i32.const 3
                                                            i32.shl
                                                            local.tee 5
                                                            i32.add
                                                            local.get 5
                                                            local.get 3
                                                            i32.sub
                                                            local.tee 5
                                                            i32.store
                                                            local.get 4
                                                            local.get 3
                                                            i32.add
                                                            local.tee 6
                                                            local.get 5
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            block  ;; label = @29
                                                              local.get 7
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 7
                                                              i32.const 3
                                                              i32.shr_u
                                                              local.tee 9
                                                              i32.const 3
                                                              i32.shl
                                                              i32.const 3448
                                                              i32.add
                                                              local.set 3
                                                              i32.const 0
                                                              i32.load offset=3428
                                                              local.set 4
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  local.get 2
                                                                  i32.const 1
                                                                  local.get 9
                                                                  i32.shl
                                                                  local.tee 9
                                                                  i32.and
                                                                  i32.eqz
                                                                  br_if 0 (;@31;)
                                                                  local.get 3
                                                                  i32.load offset=8
                                                                  local.set 9
                                                                  br 1 (;@30;)
                                                                end
                                                                i32.const 0
                                                                local.get 2
                                                                local.get 9
                                                                i32.or
                                                                i32.store offset=3408
                                                                local.get 3
                                                                local.set 9
                                                              end
                                                              local.get 9
                                                              local.get 4
                                                              i32.store offset=12
                                                              local.get 3
                                                              local.get 4
                                                              i32.store offset=8
                                                              local.get 4
                                                              local.get 3
                                                              i32.store offset=12
                                                              local.get 4
                                                              local.get 9
                                                              i32.store offset=8
                                                            end
                                                            i32.const 0
                                                            local.get 6
                                                            i32.store offset=3428
                                                            i32.const 0
                                                            local.get 5
                                                            i32.store offset=3416
                                                            br 27 (;@1;)
                                                          end
                                                          i32.const 0
                                                          local.set 4
                                                        end
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            loop  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      local.get 4
                                                                      br_table 1 (;@32;) 0 (;@33;) 0 (;@33;)
                                                                    end
                                                                    local.get 0
                                                                    i32.load offset=4
                                                                    i32.const -8
                                                                    i32.and
                                                                    local.get 3
                                                                    i32.sub
                                                                    local.tee 4
                                                                    local.get 5
                                                                    local.get 4
                                                                    local.get 5
                                                                    i32.lt_u
                                                                    local.tee 4
                                                                    select
                                                                    local.set 5
                                                                    local.get 0
                                                                    local.get 6
                                                                    local.get 4
                                                                    select
                                                                    local.set 6
                                                                    local.get 0
                                                                    local.tee 9
                                                                    i32.load offset=16
                                                                    local.tee 0
                                                                    br_if 1 (;@31;)
                                                                    i32.const 0
                                                                    local.set 4
                                                                    br 3 (;@29;)
                                                                  end
                                                                  local.get 9
                                                                  i32.const 20
                                                                  i32.add
                                                                  i32.load
                                                                  local.tee 0
                                                                  br_if 1 (;@30;)
                                                                  local.get 6
                                                                  local.get 3
                                                                  i32.add
                                                                  local.tee 11
                                                                  local.get 6
                                                                  i32.le_u
                                                                  br_if 8 (;@23;)
                                                                  local.get 6
                                                                  i32.load offset=24
                                                                  local.set 12
                                                                  block  ;; label = @32
                                                                    local.get 6
                                                                    i32.load offset=12
                                                                    local.tee 9
                                                                    local.get 6
                                                                    i32.eq
                                                                    br_if 0 (;@32;)
                                                                    local.get 6
                                                                    i32.load offset=8
                                                                    local.tee 0
                                                                    local.get 9
                                                                    i32.store offset=12
                                                                    local.get 9
                                                                    local.get 0
                                                                    i32.store offset=8
                                                                    local.get 12
                                                                    br_if 4 (;@28;)
                                                                    br 5 (;@27;)
                                                                  end
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      local.get 6
                                                                      i32.const 20
                                                                      i32.add
                                                                      local.tee 4
                                                                      i32.load
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                      local.get 6
                                                                      i32.load offset=16
                                                                      local.tee 0
                                                                      i32.eqz
                                                                      br_if 1 (;@32;)
                                                                      local.get 6
                                                                      i32.const 16
                                                                      i32.add
                                                                      local.set 4
                                                                    end
                                                                    loop  ;; label = @33
                                                                      local.get 4
                                                                      local.set 8
                                                                      local.get 0
                                                                      local.tee 9
                                                                      i32.const 20
                                                                      i32.add
                                                                      local.tee 4
                                                                      i32.load
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                      local.get 9
                                                                      i32.const 16
                                                                      i32.add
                                                                      local.set 4
                                                                      local.get 9
                                                                      i32.load offset=16
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                    end
                                                                    local.get 8
                                                                    i32.const 0
                                                                    i32.store
                                                                    local.get 12
                                                                    i32.eqz
                                                                    br_if 5 (;@27;)
                                                                    br 4 (;@28;)
                                                                  end
                                                                  i32.const 0
                                                                  local.set 9
                                                                  local.get 12
                                                                  br_if 3 (;@28;)
                                                                  br 4 (;@27;)
                                                                end
                                                                i32.const 1
                                                                local.set 4
                                                                br 1 (;@29;)
                                                              end
                                                              i32.const 1
                                                              local.set 4
                                                              br 0 (;@29;)
                                                            end
                                                          end
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                local.get 6
                                                                local.get 6
                                                                i32.load offset=28
                                                                local.tee 4
                                                                i32.const 2
                                                                i32.shl
                                                                i32.const 3712
                                                                i32.add
                                                                local.tee 0
                                                                i32.load
                                                                i32.eq
                                                                br_if 0 (;@30;)
                                                                local.get 12
                                                                i32.const 16
                                                                i32.const 20
                                                                local.get 12
                                                                i32.load offset=16
                                                                local.get 6
                                                                i32.eq
                                                                select
                                                                i32.add
                                                                local.get 9
                                                                i32.store
                                                                local.get 9
                                                                br_if 1 (;@29;)
                                                                br 3 (;@27;)
                                                              end
                                                              local.get 0
                                                              local.get 9
                                                              i32.store
                                                              local.get 9
                                                              i32.eqz
                                                              br_if 1 (;@28;)
                                                            end
                                                            local.get 9
                                                            local.get 12
                                                            i32.store offset=24
                                                            block  ;; label = @29
                                                              local.get 6
                                                              i32.load offset=16
                                                              local.tee 0
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 9
                                                              local.get 0
                                                              i32.store offset=16
                                                              local.get 0
                                                              local.get 9
                                                              i32.store offset=24
                                                            end
                                                            local.get 6
                                                            i32.const 20
                                                            i32.add
                                                            i32.load
                                                            local.tee 0
                                                            i32.eqz
                                                            br_if 1 (;@27;)
                                                            local.get 9
                                                            i32.const 20
                                                            i32.add
                                                            local.get 0
                                                            i32.store
                                                            local.get 0
                                                            local.get 9
                                                            i32.store offset=24
                                                            br 1 (;@27;)
                                                          end
                                                          i32.const 0
                                                          local.get 10
                                                          i32.const -2
                                                          local.get 4
                                                          i32.rotl
                                                          i32.and
                                                          i32.store offset=3412
                                                        end
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            local.get 5
                                                            i32.const 15
                                                            i32.gt_u
                                                            br_if 0 (;@28;)
                                                            local.get 6
                                                            local.get 5
                                                            local.get 3
                                                            i32.add
                                                            local.tee 0
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 6
                                                            local.get 0
                                                            i32.add
                                                            local.tee 0
                                                            local.get 0
                                                            i32.load offset=4
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            br 1 (;@27;)
                                                          end
                                                          local.get 11
                                                          local.get 5
                                                          i32.const 1
                                                          i32.or
                                                          i32.store offset=4
                                                          local.get 6
                                                          local.get 3
                                                          i32.const 3
                                                          i32.or
                                                          i32.store offset=4
                                                          local.get 11
                                                          local.get 5
                                                          i32.add
                                                          local.get 5
                                                          i32.store
                                                          block  ;; label = @28
                                                            local.get 7
                                                            i32.eqz
                                                            br_if 0 (;@28;)
                                                            local.get 7
                                                            i32.const 3
                                                            i32.shr_u
                                                            local.tee 3
                                                            i32.const 3
                                                            i32.shl
                                                            i32.const 3448
                                                            i32.add
                                                            local.set 4
                                                            i32.const 0
                                                            i32.load offset=3428
                                                            local.set 0
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                i32.const 1
                                                                local.get 3
                                                                i32.shl
                                                                local.tee 3
                                                                local.get 2
                                                                i32.and
                                                                i32.eqz
                                                                br_if 0 (;@30;)
                                                                local.get 4
                                                                i32.load offset=8
                                                                local.set 3
                                                                br 1 (;@29;)
                                                              end
                                                              i32.const 0
                                                              local.get 3
                                                              local.get 2
                                                              i32.or
                                                              i32.store offset=3408
                                                              local.get 4
                                                              local.set 3
                                                            end
                                                            local.get 3
                                                            local.get 0
                                                            i32.store offset=12
                                                            local.get 4
                                                            local.get 0
                                                            i32.store offset=8
                                                            local.get 0
                                                            local.get 4
                                                            i32.store offset=12
                                                            local.get 0
                                                            local.get 3
                                                            i32.store offset=8
                                                          end
                                                          i32.const 0
                                                          local.get 11
                                                          i32.store offset=3428
                                                          i32.const 0
                                                          local.get 5
                                                          i32.store offset=3416
                                                        end
                                                        local.get 6
                                                        i32.const 8
                                                        i32.add
                                                        local.set 0
                                                        br 25 (;@1;)
                                                      end
                                                      local.get 0
                                                      i32.eqz
                                                      br_if 1 (;@24;)
                                                    end
                                                    loop  ;; label = @25
                                                      local.get 0
                                                      i32.load offset=4
                                                      i32.const -8
                                                      i32.and
                                                      local.get 3
                                                      i32.sub
                                                      local.tee 2
                                                      local.get 5
                                                      i32.lt_u
                                                      local.set 6
                                                      block  ;; label = @26
                                                        local.get 0
                                                        i32.load offset=16
                                                        local.tee 4
                                                        br_if 0 (;@26;)
                                                        local.get 0
                                                        i32.const 20
                                                        i32.add
                                                        i32.load
                                                        local.set 4
                                                      end
                                                      local.get 2
                                                      local.get 5
                                                      local.get 6
                                                      select
                                                      local.set 5
                                                      local.get 0
                                                      local.get 9
                                                      local.get 6
                                                      select
                                                      local.set 9
                                                      local.get 4
                                                      local.set 0
                                                      local.get 4
                                                      br_if 0 (;@25;)
                                                    end
                                                  end
                                                  local.get 9
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 5
                                                  i32.const 0
                                                  i32.load offset=3416
                                                  local.get 3
                                                  i32.sub
                                                  i32.ge_u
                                                  br_if 0 (;@23;)
                                                  local.get 9
                                                  local.get 3
                                                  i32.add
                                                  local.tee 8
                                                  local.get 9
                                                  i32.le_u
                                                  br_if 0 (;@23;)
                                                  local.get 9
                                                  i32.load offset=24
                                                  local.set 10
                                                  local.get 9
                                                  i32.load offset=12
                                                  local.tee 6
                                                  local.get 9
                                                  i32.eq
                                                  br_if 1 (;@22;)
                                                  local.get 9
                                                  i32.load offset=8
                                                  local.tee 0
                                                  local.get 6
                                                  i32.store offset=12
                                                  local.get 6
                                                  local.get 0
                                                  i32.store offset=8
                                                  local.get 10
                                                  br_if 20 (;@3;)
                                                  br 21 (;@2;)
                                                end
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            i32.const 0
                                                            i32.load offset=3416
                                                            local.tee 0
                                                            local.get 3
                                                            i32.ge_u
                                                            br_if 0 (;@28;)
                                                            i32.const 0
                                                            i32.load offset=3420
                                                            local.tee 6
                                                            local.get 3
                                                            i32.le_u
                                                            br_if 1 (;@27;)
                                                            i32.const 0
                                                            i32.load offset=3432
                                                            local.tee 0
                                                            local.get 3
                                                            i32.add
                                                            local.tee 4
                                                            local.get 6
                                                            local.get 3
                                                            i32.sub
                                                            local.tee 5
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            i32.const 0
                                                            local.get 5
                                                            i32.store offset=3420
                                                            i32.const 0
                                                            local.get 4
                                                            i32.store offset=3432
                                                            local.get 0
                                                            local.get 3
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 0
                                                            i32.const 8
                                                            i32.add
                                                            local.set 0
                                                            br 27 (;@1;)
                                                          end
                                                          i32.const 0
                                                          i32.load offset=3428
                                                          local.set 4
                                                          local.get 0
                                                          local.get 3
                                                          i32.sub
                                                          local.tee 5
                                                          i32.const 16
                                                          i32.lt_u
                                                          br_if 1 (;@26;)
                                                          local.get 4
                                                          local.get 3
                                                          i32.add
                                                          local.tee 6
                                                          local.get 5
                                                          i32.const 1
                                                          i32.or
                                                          i32.store offset=4
                                                          i32.const 0
                                                          local.get 5
                                                          i32.store offset=3416
                                                          i32.const 0
                                                          local.get 6
                                                          i32.store offset=3428
                                                          local.get 4
                                                          local.get 0
                                                          i32.add
                                                          local.get 5
                                                          i32.store
                                                          local.get 4
                                                          local.get 3
                                                          i32.const 3
                                                          i32.or
                                                          i32.store offset=4
                                                          br 2 (;@25;)
                                                        end
                                                        i32.const 0
                                                        i32.load offset=3880
                                                        i32.eqz
                                                        br_if 2 (;@24;)
                                                        i32.const 0
                                                        i32.load offset=3888
                                                        local.set 4
                                                        br 3 (;@23;)
                                                      end
                                                      local.get 4
                                                      local.get 0
                                                      i32.const 3
                                                      i32.or
                                                      i32.store offset=4
                                                      local.get 4
                                                      local.get 0
                                                      i32.add
                                                      local.tee 0
                                                      local.get 0
                                                      i32.load offset=4
                                                      i32.const 1
                                                      i32.or
                                                      i32.store offset=4
                                                      i32.const 0
                                                      i32.const 0
                                                      i32.store offset=3428
                                                      i32.const 0
                                                      i32.const 0
                                                      i32.store offset=3416
                                                    end
                                                    local.get 4
                                                    i32.const 8
                                                    i32.add
                                                    local.set 0
                                                    br 23 (;@1;)
                                                  end
                                                  i32.const 0
                                                  i64.const -1
                                                  i64.store offset=3892 align=4
                                                  i32.const 0
                                                  i64.const 281474976776192
                                                  i64.store offset=3884 align=4
                                                  i32.const 0
                                                  local.get 1
                                                  i32.const 12
                                                  i32.add
                                                  i32.const -16
                                                  i32.and
                                                  i32.const 1431655768
                                                  i32.xor
                                                  i32.store offset=3880
                                                  i32.const 0
                                                  i32.const 0
                                                  i32.store offset=3900
                                                  i32.const 0
                                                  i32.const 0
                                                  i32.store offset=3852
                                                  i32.const 65536
                                                  local.set 4
                                                end
                                                i32.const 0
                                                local.set 0
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 4
                                                    local.get 3
                                                    i32.const 47
                                                    i32.add
                                                    local.tee 7
                                                    i32.add
                                                    local.tee 2
                                                    i32.const 0
                                                    local.get 4
                                                    i32.sub
                                                    local.tee 8
                                                    i32.and
                                                    local.tee 9
                                                    local.get 3
                                                    i32.le_u
                                                    br_if 0 (;@24;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=3848
                                                      local.tee 0
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 0
                                                      i32.load offset=3840
                                                      local.tee 4
                                                      local.get 9
                                                      i32.add
                                                      local.tee 5
                                                      local.get 4
                                                      i32.le_u
                                                      br_if 2 (;@23;)
                                                      local.get 5
                                                      local.get 0
                                                      i32.gt_u
                                                      br_if 2 (;@23;)
                                                    end
                                                    i32.const 0
                                                    i32.load8_u offset=3852
                                                    i32.const 4
                                                    i32.and
                                                    br_if 10 (;@14;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=3432
                                                      local.tee 4
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 3856
                                                      local.set 0
                                                      loop  ;; label = @26
                                                        block  ;; label = @27
                                                          local.get 0
                                                          i32.load
                                                          local.tee 5
                                                          local.get 4
                                                          i32.gt_u
                                                          br_if 0 (;@27;)
                                                          local.get 5
                                                          local.get 0
                                                          i32.load offset=4
                                                          i32.add
                                                          local.get 4
                                                          i32.gt_u
                                                          br_if 6 (;@21;)
                                                        end
                                                        local.get 0
                                                        i32.load offset=8
                                                        local.tee 0
                                                        br_if 0 (;@26;)
                                                      end
                                                    end
                                                    i32.const 0
                                                    call $sbrk
                                                    local.tee 6
                                                    i32.const -1
                                                    i32.eq
                                                    br_if 9 (;@15;)
                                                    local.get 9
                                                    local.set 2
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=3884
                                                      local.tee 0
                                                      i32.const -1
                                                      i32.add
                                                      local.tee 4
                                                      local.get 6
                                                      i32.and
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 9
                                                      local.get 6
                                                      i32.sub
                                                      local.get 4
                                                      local.get 6
                                                      i32.add
                                                      i32.const 0
                                                      local.get 0
                                                      i32.sub
                                                      i32.and
                                                      i32.add
                                                      local.set 2
                                                    end
                                                    local.get 2
                                                    local.get 3
                                                    i32.le_u
                                                    br_if 9 (;@15;)
                                                    local.get 2
                                                    i32.const 2147483646
                                                    i32.gt_u
                                                    br_if 9 (;@15;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=3848
                                                      local.tee 0
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 0
                                                      i32.load offset=3840
                                                      local.tee 4
                                                      local.get 2
                                                      i32.add
                                                      local.tee 5
                                                      local.get 4
                                                      i32.le_u
                                                      br_if 10 (;@15;)
                                                      local.get 5
                                                      local.get 0
                                                      i32.gt_u
                                                      br_if 10 (;@15;)
                                                    end
                                                    local.get 2
                                                    call $sbrk
                                                    local.tee 0
                                                    local.get 6
                                                    i32.ne
                                                    br_if 4 (;@20;)
                                                    br 11 (;@13;)
                                                  end
                                                  i32.const 0
                                                  i32.const 48
                                                  i32.store offset=3904
                                                  br 22 (;@1;)
                                                end
                                                i32.const 0
                                                local.set 0
                                                i32.const 0
                                                i32.const 48
                                                i32.store offset=3904
                                                br 21 (;@1;)
                                              end
                                              block  ;; label = @22
                                                local.get 9
                                                i32.const 20
                                                i32.add
                                                local.tee 4
                                                i32.load
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                local.get 9
                                                i32.load offset=16
                                                local.tee 0
                                                i32.eqz
                                                br_if 3 (;@19;)
                                                local.get 9
                                                i32.const 16
                                                i32.add
                                                local.set 4
                                              end
                                              loop  ;; label = @22
                                                local.get 4
                                                local.set 2
                                                local.get 0
                                                local.tee 6
                                                i32.const 20
                                                i32.add
                                                local.tee 4
                                                i32.load
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                local.get 6
                                                i32.const 16
                                                i32.add
                                                local.set 4
                                                local.get 6
                                                i32.load offset=16
                                                local.tee 0
                                                br_if 0 (;@22;)
                                              end
                                              local.get 2
                                              i32.const 0
                                              i32.store
                                              local.get 10
                                              i32.eqz
                                              br_if 19 (;@2;)
                                              br 18 (;@3;)
                                            end
                                            local.get 2
                                            local.get 6
                                            i32.sub
                                            local.get 8
                                            i32.and
                                            local.tee 2
                                            i32.const 2147483646
                                            i32.gt_u
                                            br_if 5 (;@15;)
                                            local.get 2
                                            call $sbrk
                                            local.tee 6
                                            local.get 0
                                            i32.load
                                            local.get 0
                                            i32.load offset=4
                                            i32.add
                                            i32.eq
                                            br_if 3 (;@17;)
                                            local.get 6
                                            local.set 0
                                          end
                                          local.get 0
                                          local.set 6
                                          local.get 3
                                          i32.const 48
                                          i32.add
                                          local.get 2
                                          i32.le_u
                                          br_if 1 (;@18;)
                                          local.get 2
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 1 (;@18;)
                                          local.get 6
                                          i32.const -1
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 7
                                          local.get 2
                                          i32.sub
                                          i32.const 0
                                          i32.load offset=3888
                                          local.tee 0
                                          i32.add
                                          i32.const 0
                                          local.get 0
                                          i32.sub
                                          i32.and
                                          local.tee 0
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 6 (;@13;)
                                          local.get 0
                                          call $sbrk
                                          i32.const -1
                                          i32.eq
                                          br_if 3 (;@16;)
                                          local.get 0
                                          local.get 2
                                          i32.add
                                          local.set 2
                                          br 6 (;@13;)
                                        end
                                        i32.const 0
                                        local.set 6
                                        local.get 10
                                        br_if 15 (;@3;)
                                        br 16 (;@2;)
                                      end
                                      local.get 6
                                      i32.const -1
                                      i32.ne
                                      br_if 4 (;@13;)
                                      br 2 (;@15;)
                                    end
                                    local.get 6
                                    i32.const -1
                                    i32.ne
                                    br_if 3 (;@13;)
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.get 2
                                  i32.sub
                                  call $sbrk
                                  drop
                                end
                                i32.const 0
                                i32.const 0
                                i32.load offset=3852
                                i32.const 4
                                i32.or
                                i32.store offset=3852
                              end
                              local.get 9
                              i32.const 2147483646
                              i32.gt_u
                              br_if 1 (;@12;)
                              local.get 9
                              call $sbrk
                              local.tee 6
                              i32.const 0
                              call $sbrk
                              local.tee 0
                              i32.ge_u
                              br_if 1 (;@12;)
                              local.get 6
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              local.get 6
                              i32.sub
                              local.tee 2
                              local.get 3
                              i32.const 40
                              i32.add
                              i32.le_u
                              br_if 1 (;@12;)
                            end
                            i32.const 0
                            i32.const 0
                            i32.load offset=3840
                            local.get 2
                            i32.add
                            local.tee 0
                            i32.store offset=3840
                            block  ;; label = @13
                              local.get 0
                              i32.const 0
                              i32.load offset=3844
                              i32.le_u
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 0
                              i32.store offset=3844
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    i32.const 0
                                    i32.load offset=3432
                                    local.tee 4
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 3856
                                    local.set 0
                                    loop  ;; label = @17
                                      local.get 6
                                      local.get 0
                                      i32.load
                                      local.tee 5
                                      local.get 0
                                      i32.load offset=4
                                      local.tee 9
                                      i32.add
                                      i32.eq
                                      br_if 2 (;@15;)
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 0
                                      br_if 0 (;@17;)
                                      br 3 (;@14;)
                                    end
                                  end
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      i32.const 0
                                      i32.load offset=3424
                                      local.tee 0
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 6
                                      local.get 0
                                      i32.ge_u
                                      br_if 1 (;@16;)
                                    end
                                    i32.const 0
                                    local.get 6
                                    i32.store offset=3424
                                  end
                                  i32.const 0
                                  local.set 0
                                  i32.const 0
                                  local.get 2
                                  i32.store offset=3860
                                  i32.const 0
                                  local.get 6
                                  i32.store offset=3856
                                  i32.const 0
                                  i32.const -1
                                  i32.store offset=3440
                                  i32.const 0
                                  i32.const 0
                                  i32.load offset=3880
                                  i32.store offset=3444
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=3868
                                  loop  ;; label = @16
                                    local.get 0
                                    i32.const 3456
                                    i32.add
                                    local.get 0
                                    i32.const 3448
                                    i32.add
                                    local.tee 4
                                    i32.store
                                    local.get 0
                                    i32.const 3460
                                    i32.add
                                    local.get 4
                                    i32.store
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.tee 0
                                    i32.const 256
                                    i32.ne
                                    br_if 0 (;@16;)
                                  end
                                  local.get 6
                                  i32.const -8
                                  local.get 6
                                  i32.sub
                                  i32.const 7
                                  i32.and
                                  i32.const 0
                                  local.get 6
                                  i32.const 8
                                  i32.add
                                  i32.const 7
                                  i32.and
                                  select
                                  local.tee 0
                                  i32.add
                                  local.tee 4
                                  local.get 2
                                  i32.const -40
                                  i32.add
                                  local.tee 5
                                  local.get 0
                                  i32.sub
                                  local.tee 0
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  i32.const 0
                                  i32.const 0
                                  i32.load offset=3896
                                  i32.store offset=3436
                                  i32.const 0
                                  local.get 0
                                  i32.store offset=3420
                                  i32.const 0
                                  local.get 4
                                  i32.store offset=3432
                                  local.get 6
                                  local.get 5
                                  i32.add
                                  i32.const 40
                                  i32.store offset=4
                                  br 2 (;@13;)
                                end
                                local.get 0
                                i32.load8_u offset=12
                                i32.const 8
                                i32.and
                                br_if 0 (;@14;)
                                local.get 6
                                local.get 4
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                local.get 4
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 4
                                i32.const -8
                                local.get 4
                                i32.sub
                                i32.const 7
                                i32.and
                                i32.const 0
                                local.get 4
                                i32.const 8
                                i32.add
                                i32.const 7
                                i32.and
                                select
                                local.tee 5
                                i32.add
                                local.tee 6
                                i32.const 0
                                i32.load offset=3420
                                local.get 2
                                i32.add
                                local.tee 8
                                local.get 5
                                i32.sub
                                local.tee 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 0
                                i32.const 4
                                i32.add
                                local.get 9
                                local.get 2
                                i32.add
                                i32.store
                                i32.const 0
                                i32.const 0
                                i32.load offset=3896
                                i32.store offset=3436
                                i32.const 0
                                local.get 5
                                i32.store offset=3420
                                i32.const 0
                                local.get 6
                                i32.store offset=3432
                                local.get 4
                                local.get 8
                                i32.add
                                i32.const 40
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 6
                                i32.const 0
                                i32.load offset=3424
                                i32.ge_u
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 6
                                i32.store offset=3424
                              end
                              local.get 6
                              local.get 2
                              i32.add
                              local.set 5
                              i32.const 3856
                              local.set 0
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              loop  ;; label = @22
                                                local.get 0
                                                i32.load
                                                local.get 5
                                                i32.eq
                                                br_if 1 (;@21;)
                                                local.get 0
                                                i32.load offset=8
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                br 2 (;@20;)
                                              end
                                            end
                                            local.get 0
                                            i32.load8_u offset=12
                                            i32.const 8
                                            i32.and
                                            br_if 0 (;@20;)
                                            local.get 0
                                            local.get 6
                                            i32.store
                                            local.get 0
                                            local.get 0
                                            i32.load offset=4
                                            local.get 2
                                            i32.add
                                            i32.store offset=4
                                            local.get 6
                                            i32.const -8
                                            local.get 6
                                            i32.sub
                                            i32.const 7
                                            i32.and
                                            i32.const 0
                                            local.get 6
                                            i32.const 8
                                            i32.add
                                            i32.const 7
                                            i32.and
                                            select
                                            i32.add
                                            local.tee 2
                                            local.get 3
                                            i32.const 3
                                            i32.or
                                            i32.store offset=4
                                            local.get 5
                                            i32.const -8
                                            local.get 5
                                            i32.sub
                                            i32.const 7
                                            i32.and
                                            i32.const 0
                                            local.get 5
                                            i32.const 8
                                            i32.add
                                            i32.const 7
                                            i32.and
                                            select
                                            i32.add
                                            local.tee 6
                                            local.get 2
                                            i32.sub
                                            local.get 3
                                            i32.sub
                                            local.set 0
                                            local.get 2
                                            local.get 3
                                            i32.add
                                            local.set 5
                                            local.get 4
                                            local.get 6
                                            i32.eq
                                            br_if 1 (;@19;)
                                            i32.const 0
                                            i32.load offset=3428
                                            local.get 6
                                            i32.eq
                                            br_if 9 (;@11;)
                                            local.get 6
                                            i32.load offset=4
                                            local.tee 4
                                            i32.const 3
                                            i32.and
                                            i32.const 1
                                            i32.ne
                                            br_if 15 (;@5;)
                                            local.get 4
                                            i32.const -8
                                            i32.and
                                            local.set 7
                                            local.get 4
                                            i32.const 255
                                            i32.gt_u
                                            br_if 10 (;@10;)
                                            local.get 6
                                            i32.load offset=12
                                            local.tee 3
                                            local.get 6
                                            i32.load offset=8
                                            local.tee 9
                                            i32.eq
                                            br_if 11 (;@9;)
                                            local.get 3
                                            local.get 9
                                            i32.store offset=8
                                            local.get 9
                                            local.get 3
                                            i32.store offset=12
                                            br 14 (;@6;)
                                          end
                                          i32.const 3856
                                          local.set 0
                                          block  ;; label = @20
                                            loop  ;; label = @21
                                              block  ;; label = @22
                                                local.get 0
                                                i32.load
                                                local.tee 5
                                                local.get 4
                                                i32.gt_u
                                                br_if 0 (;@22;)
                                                local.get 5
                                                local.get 0
                                                i32.load offset=4
                                                i32.add
                                                local.tee 5
                                                local.get 4
                                                i32.gt_u
                                                br_if 2 (;@20;)
                                              end
                                              local.get 0
                                              i32.load offset=8
                                              local.set 0
                                              br 0 (;@21;)
                                            end
                                          end
                                          local.get 6
                                          i32.const -8
                                          local.get 6
                                          i32.sub
                                          i32.const 7
                                          i32.and
                                          i32.const 0
                                          local.get 6
                                          i32.const 8
                                          i32.add
                                          i32.const 7
                                          i32.and
                                          select
                                          local.tee 0
                                          i32.add
                                          local.tee 8
                                          local.get 2
                                          i32.const -40
                                          i32.add
                                          local.tee 9
                                          local.get 0
                                          i32.sub
                                          local.tee 0
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          local.get 6
                                          local.get 9
                                          i32.add
                                          i32.const 40
                                          i32.store offset=4
                                          local.get 4
                                          local.get 5
                                          i32.const 39
                                          local.get 5
                                          i32.sub
                                          i32.const 7
                                          i32.and
                                          i32.const 0
                                          local.get 5
                                          i32.const -39
                                          i32.add
                                          i32.const 7
                                          i32.and
                                          select
                                          i32.add
                                          i32.const -47
                                          i32.add
                                          local.tee 9
                                          local.get 9
                                          local.get 4
                                          i32.const 16
                                          i32.add
                                          i32.lt_u
                                          select
                                          local.tee 9
                                          i32.const 27
                                          i32.store offset=4
                                          i32.const 0
                                          i32.const 0
                                          i32.load offset=3896
                                          i32.store offset=3436
                                          i32.const 0
                                          local.get 0
                                          i32.store offset=3420
                                          i32.const 0
                                          local.get 8
                                          i32.store offset=3432
                                          local.get 9
                                          i32.const 16
                                          i32.add
                                          i32.const 0
                                          i64.load offset=3864 align=4
                                          i64.store align=4
                                          local.get 9
                                          i32.const 0
                                          i64.load offset=3856 align=4
                                          i64.store offset=8 align=4
                                          i32.const 0
                                          local.get 2
                                          i32.store offset=3860
                                          i32.const 0
                                          local.get 6
                                          i32.store offset=3856
                                          i32.const 0
                                          local.get 9
                                          i32.const 8
                                          i32.add
                                          i32.store offset=3864
                                          i32.const 0
                                          i32.const 0
                                          i32.store offset=3868
                                          local.get 9
                                          i32.const 28
                                          i32.add
                                          local.set 0
                                          loop  ;; label = @20
                                            local.get 0
                                            i32.const 7
                                            i32.store
                                            local.get 0
                                            i32.const 4
                                            i32.add
                                            local.tee 0
                                            local.get 5
                                            i32.lt_u
                                            br_if 0 (;@20;)
                                          end
                                          local.get 9
                                          local.get 4
                                          i32.eq
                                          br_if 6 (;@13;)
                                          local.get 9
                                          i32.const 4
                                          i32.add
                                          local.tee 0
                                          local.get 0
                                          i32.load
                                          i32.const -2
                                          i32.and
                                          i32.store
                                          local.get 9
                                          local.get 9
                                          local.get 4
                                          i32.sub
                                          local.tee 2
                                          i32.store
                                          local.get 4
                                          local.get 2
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          block  ;; label = @20
                                            local.get 2
                                            i32.const 255
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 2
                                            i32.const 3
                                            i32.shr_u
                                            local.tee 5
                                            i32.const 3
                                            i32.shl
                                            i32.const 3448
                                            i32.add
                                            local.set 0
                                            i32.const 0
                                            i32.load offset=3408
                                            local.tee 6
                                            i32.const 1
                                            local.get 5
                                            i32.shl
                                            local.tee 5
                                            i32.and
                                            i32.eqz
                                            br_if 2 (;@18;)
                                            local.get 0
                                            i32.load offset=8
                                            local.set 5
                                            br 3 (;@17;)
                                          end
                                          i32.const 0
                                          local.set 0
                                          block  ;; label = @20
                                            local.get 2
                                            i32.const 8
                                            i32.shr_u
                                            local.tee 5
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 31
                                            local.set 0
                                            local.get 2
                                            i32.const 16777215
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 2
                                            i32.const 14
                                            local.get 5
                                            local.get 5
                                            i32.const 1048320
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 8
                                            i32.and
                                            local.tee 0
                                            i32.shl
                                            local.tee 5
                                            i32.const 520192
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 4
                                            i32.and
                                            local.tee 6
                                            local.get 0
                                            i32.or
                                            local.get 5
                                            local.get 6
                                            i32.shl
                                            local.tee 0
                                            i32.const 245760
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 2
                                            i32.and
                                            local.tee 5
                                            i32.or
                                            i32.sub
                                            local.get 0
                                            local.get 5
                                            i32.shl
                                            i32.const 15
                                            i32.shr_u
                                            i32.add
                                            local.tee 0
                                            i32.const 7
                                            i32.add
                                            i32.shr_u
                                            i32.const 1
                                            i32.and
                                            local.get 0
                                            i32.const 1
                                            i32.shl
                                            i32.or
                                            local.set 0
                                          end
                                          local.get 4
                                          i64.const 0
                                          i64.store offset=16 align=4
                                          local.get 4
                                          i32.const 28
                                          i32.add
                                          local.get 0
                                          i32.store
                                          local.get 0
                                          i32.const 2
                                          i32.shl
                                          i32.const 3712
                                          i32.add
                                          local.set 5
                                          i32.const 0
                                          i32.load offset=3412
                                          local.tee 6
                                          i32.const 1
                                          local.get 0
                                          i32.shl
                                          local.tee 9
                                          i32.and
                                          i32.eqz
                                          br_if 3 (;@16;)
                                          local.get 2
                                          i32.const 0
                                          i32.const 25
                                          local.get 0
                                          i32.const 1
                                          i32.shr_u
                                          i32.sub
                                          local.get 0
                                          i32.const 31
                                          i32.eq
                                          select
                                          i32.shl
                                          local.set 0
                                          local.get 5
                                          i32.load
                                          local.set 6
                                          loop  ;; label = @20
                                            local.get 6
                                            local.tee 5
                                            i32.load offset=4
                                            i32.const -8
                                            i32.and
                                            local.get 2
                                            i32.eq
                                            br_if 6 (;@14;)
                                            local.get 0
                                            i32.const 29
                                            i32.shr_u
                                            local.set 6
                                            local.get 0
                                            i32.const 1
                                            i32.shl
                                            local.set 0
                                            local.get 5
                                            local.get 6
                                            i32.const 4
                                            i32.and
                                            i32.add
                                            i32.const 16
                                            i32.add
                                            local.tee 9
                                            i32.load
                                            local.tee 6
                                            br_if 0 (;@20;)
                                          end
                                          local.get 9
                                          local.get 4
                                          i32.store
                                          local.get 4
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.store
                                          br 4 (;@15;)
                                        end
                                        i32.const 0
                                        local.get 5
                                        i32.store offset=3432
                                        i32.const 0
                                        i32.const 0
                                        i32.load offset=3420
                                        local.get 0
                                        i32.add
                                        local.tee 0
                                        i32.store offset=3420
                                        local.get 5
                                        local.get 0
                                        i32.const 1
                                        i32.or
                                        i32.store offset=4
                                        br 14 (;@4;)
                                      end
                                      i32.const 0
                                      local.get 6
                                      local.get 5
                                      i32.or
                                      i32.store offset=3408
                                      local.get 0
                                      local.set 5
                                    end
                                    local.get 5
                                    local.get 4
                                    i32.store offset=12
                                    local.get 0
                                    local.get 4
                                    i32.store offset=8
                                    local.get 4
                                    local.get 0
                                    i32.store offset=12
                                    local.get 4
                                    local.get 5
                                    i32.store offset=8
                                    br 3 (;@13;)
                                  end
                                  local.get 5
                                  local.get 4
                                  i32.store
                                  i32.const 0
                                  local.get 6
                                  local.get 9
                                  i32.or
                                  i32.store offset=3412
                                  local.get 4
                                  i32.const 24
                                  i32.add
                                  local.get 5
                                  i32.store
                                end
                                local.get 4
                                local.get 4
                                i32.store offset=12
                                local.get 4
                                local.get 4
                                i32.store offset=8
                                br 1 (;@13;)
                              end
                              local.get 5
                              i32.load offset=8
                              local.tee 0
                              local.get 4
                              i32.store offset=12
                              local.get 5
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              i32.const 24
                              i32.add
                              i32.const 0
                              i32.store
                              local.get 4
                              local.get 5
                              i32.store offset=12
                              local.get 4
                              local.get 0
                              i32.store offset=8
                            end
                            i32.const 0
                            i32.load offset=3420
                            local.tee 0
                            local.get 3
                            i32.le_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=3432
                            local.tee 4
                            local.get 3
                            i32.add
                            local.tee 5
                            local.get 0
                            local.get 3
                            i32.sub
                            local.tee 0
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.get 0
                            i32.store offset=3420
                            i32.const 0
                            local.get 5
                            i32.store offset=3432
                            local.get 4
                            local.get 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 4
                            i32.const 8
                            i32.add
                            local.set 0
                            br 11 (;@1;)
                          end
                          i32.const 0
                          local.set 0
                          i32.const 0
                          i32.const 48
                          i32.store offset=3904
                          br 10 (;@1;)
                        end
                        i32.const 0
                        local.get 5
                        i32.store offset=3428
                        i32.const 0
                        i32.const 0
                        i32.load offset=3416
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store offset=3416
                        local.get 5
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 5
                        local.get 0
                        i32.add
                        local.get 0
                        i32.store
                        br 6 (;@4;)
                      end
                      local.get 6
                      i32.load offset=24
                      local.set 10
                      local.get 6
                      i32.load offset=12
                      local.tee 9
                      local.get 6
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 6
                      i32.load offset=8
                      local.tee 4
                      local.get 9
                      i32.store offset=12
                      local.get 9
                      local.get 4
                      i32.store offset=8
                      local.get 10
                      br_if 2 (;@7;)
                      br 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=3408
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=3408
                    br 2 (;@6;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      i32.const 20
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 16
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      i32.eqz
                      br_if 1 (;@8;)
                    end
                    loop  ;; label = @9
                      local.get 4
                      local.set 8
                      local.get 3
                      local.tee 9
                      i32.const 20
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      br_if 0 (;@9;)
                      local.get 9
                      i32.const 16
                      i32.add
                      local.set 4
                      local.get 9
                      i32.load offset=16
                      local.tee 3
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    i32.const 0
                    i32.store
                    local.get 10
                    i32.eqz
                    br_if 2 (;@6;)
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 9
                  local.get 10
                  i32.eqz
                  br_if 1 (;@6;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=28
                      local.tee 3
                      i32.const 2
                      i32.shl
                      i32.const 3712
                      i32.add
                      local.tee 4
                      i32.load
                      local.get 6
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 10
                      i32.const 16
                      i32.const 20
                      local.get 10
                      i32.load offset=16
                      local.get 6
                      i32.eq
                      select
                      i32.add
                      local.get 9
                      i32.store
                      local.get 9
                      br_if 1 (;@8;)
                      br 3 (;@6;)
                    end
                    local.get 4
                    local.get 9
                    i32.store
                    local.get 9
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  local.get 9
                  local.get 10
                  i32.store offset=24
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=16
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 4
                    i32.store offset=16
                    local.get 4
                    local.get 9
                    i32.store offset=24
                  end
                  local.get 6
                  i32.const 20
                  i32.add
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 9
                  i32.const 20
                  i32.add
                  local.get 4
                  i32.store
                  local.get 4
                  local.get 9
                  i32.store offset=24
                  br 1 (;@6;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=3412
                i32.const -2
                local.get 3
                i32.rotl
                i32.and
                i32.store offset=3412
              end
              local.get 7
              local.get 0
              i32.add
              local.set 0
              local.get 6
              local.get 7
              i32.add
              local.set 6
            end
            local.get 6
            local.get 6
            i32.load offset=4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 5
            local.get 0
            i32.add
            local.get 0
            i32.store
            local.get 5
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 3
                        i32.shr_u
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.const 3448
                        i32.add
                        local.set 0
                        i32.const 0
                        i32.load offset=3408
                        local.tee 3
                        i32.const 1
                        local.get 4
                        i32.shl
                        local.tee 4
                        i32.and
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        i32.load offset=8
                        local.set 4
                        br 2 (;@8;)
                      end
                      i32.const 0
                      local.set 4
                      block  ;; label = @10
                        local.get 0
                        i32.const 8
                        i32.shr_u
                        local.tee 3
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 31
                        local.set 4
                        local.get 0
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 14
                        local.get 3
                        local.get 3
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        local.tee 4
                        i32.shl
                        local.tee 3
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        local.tee 6
                        local.get 4
                        i32.or
                        local.get 3
                        local.get 6
                        i32.shl
                        local.tee 4
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        local.tee 3
                        i32.or
                        i32.sub
                        local.get 4
                        local.get 3
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        i32.add
                        local.tee 4
                        i32.const 7
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.or
                        local.set 4
                      end
                      local.get 5
                      local.get 4
                      i32.store offset=28
                      local.get 5
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.const 3712
                      i32.add
                      local.set 3
                      i32.const 0
                      i32.load offset=3412
                      local.tee 6
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 9
                      i32.and
                      i32.eqz
                      br_if 2 (;@7;)
                      local.get 0
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 4
                      local.get 3
                      i32.load
                      local.set 6
                      loop  ;; label = @10
                        local.get 6
                        local.tee 3
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 0
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 4
                        i32.const 29
                        i32.shr_u
                        local.set 6
                        local.get 4
                        i32.const 1
                        i32.shl
                        local.set 4
                        local.get 3
                        local.get 6
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 9
                        i32.load
                        local.tee 6
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      local.get 5
                      i32.store
                      local.get 5
                      local.get 3
                      i32.store offset=24
                      br 3 (;@6;)
                    end
                    i32.const 0
                    local.get 3
                    local.get 4
                    i32.or
                    i32.store offset=3408
                    local.get 0
                    local.set 4
                  end
                  local.get 4
                  local.get 5
                  i32.store offset=12
                  local.get 0
                  local.get 5
                  i32.store offset=8
                  local.get 5
                  local.get 0
                  i32.store offset=12
                  local.get 5
                  local.get 4
                  i32.store offset=8
                  br 3 (;@4;)
                end
                local.get 3
                local.get 5
                i32.store
                i32.const 0
                local.get 6
                local.get 9
                i32.or
                i32.store offset=3412
                local.get 5
                local.get 3
                i32.store offset=24
              end
              local.get 5
              local.get 5
              i32.store offset=12
              local.get 5
              local.get 5
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.tee 0
            local.get 5
            i32.store offset=12
            local.get 3
            local.get 5
            i32.store offset=8
            local.get 5
            i32.const 0
            i32.store offset=24
            local.get 5
            local.get 3
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
          end
          local.get 2
          i32.const 8
          i32.add
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 3712
              i32.add
              local.tee 0
              i32.load
              i32.eq
              br_if 0 (;@5;)
              local.get 10
              i32.const 16
              i32.const 20
              local.get 10
              i32.load offset=16
              local.get 9
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            local.get 0
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          local.get 10
          i32.store offset=24
          block  ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 6
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 0
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        i32.const 0
        local.get 7
        i32.const -2
        local.get 4
        i32.rotl
        i32.and
        local.tee 7
        i32.store offset=3412
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 9
          local.get 5
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 9
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 8
        local.get 5
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 9
        local.get 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 8
        local.get 5
        i32.add
        local.get 5
        i32.store
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 3
                  i32.shr_u
                  local.tee 4
                  i32.const 3
                  i32.shl
                  i32.const 3448
                  i32.add
                  local.set 0
                  i32.const 0
                  i32.load offset=3408
                  local.tee 5
                  i32.const 1
                  local.get 4
                  i32.shl
                  local.tee 4
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 0
                  i32.load offset=8
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 5
                i32.const 8
                i32.shr_u
                local.tee 4
                i32.eqz
                br_if 2 (;@4;)
                i32.const 31
                local.set 0
                local.get 5
                i32.const 16777215
                i32.gt_u
                br_if 3 (;@3;)
                local.get 5
                i32.const 14
                local.get 4
                local.get 4
                i32.const 1048320
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 8
                i32.and
                local.tee 0
                i32.shl
                local.tee 4
                i32.const 520192
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 4
                i32.and
                local.tee 3
                local.get 0
                i32.or
                local.get 4
                local.get 3
                i32.shl
                local.tee 0
                i32.const 245760
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 2
                i32.and
                local.tee 4
                i32.or
                i32.sub
                local.get 0
                local.get 4
                i32.shl
                i32.const 15
                i32.shr_u
                i32.add
                local.tee 0
                i32.const 7
                i32.add
                i32.shr_u
                i32.const 1
                i32.and
                local.get 0
                i32.const 1
                i32.shl
                i32.or
                local.set 0
                br 3 (;@3;)
              end
              i32.const 0
              local.get 5
              local.get 4
              i32.or
              i32.store offset=3408
              local.get 0
              local.set 4
            end
            local.get 4
            local.get 8
            i32.store offset=12
            local.get 0
            local.get 8
            i32.store offset=8
            local.get 8
            local.get 0
            i32.store offset=12
            local.get 8
            local.get 4
            i32.store offset=8
            br 2 (;@2;)
          end
          i32.const 0
          local.set 0
        end
        local.get 8
        local.get 0
        i32.store offset=28
        local.get 8
        i64.const 0
        i64.store offset=16 align=4
        local.get 0
        i32.const 2
        i32.shl
        i32.const 3712
        i32.add
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 1
              local.get 0
              i32.shl
              local.tee 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 4
              i32.load
              local.set 3
              loop  ;; label = @6
                local.get 3
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 5
                i32.eq
                br_if 3 (;@3;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 3
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 4
                local.get 3
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 6
                i32.load
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 6
              local.get 8
              i32.store
              local.get 8
              local.get 4
              i32.store offset=24
              br 1 (;@4;)
            end
            local.get 4
            local.get 8
            i32.store
            i32.const 0
            local.get 7
            local.get 3
            i32.or
            i32.store offset=3412
            local.get 8
            local.get 4
            i32.store offset=24
          end
          local.get 8
          local.get 8
          i32.store offset=12
          local.get 8
          local.get 8
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 8
        i32.store offset=12
        local.get 4
        local.get 8
        i32.store offset=8
        local.get 8
        i32.const 0
        i32.store offset=24
        local.get 8
        local.get 4
        i32.store offset=12
        local.get 8
        local.get 0
        i32.store offset=8
      end
      local.get 9
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $free (type 3) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 3) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.add
        local.tee 1
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 2
        i32.const -8
        i32.and
        local.tee 0
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            local.get 1
            local.get 1
            i32.load
            local.tee 2
            i32.sub
            local.tee 1
            i32.const 0
            i32.load offset=3424
            i32.lt_u
            br_if 2 (;@2;)
            local.get 2
            local.get 0
            i32.add
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=3428
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 255
                      i32.gt_u
                      br_if 1 (;@8;)
                      local.get 1
                      i32.load offset=12
                      local.tee 4
                      local.get 1
                      i32.load offset=8
                      local.tee 5
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 4
                      i32.store offset=12
                      local.get 1
                      local.get 3
                      i32.lt_u
                      br_if 6 (;@3;)
                      br 7 (;@2;)
                    end
                    local.get 3
                    i32.load offset=4
                    local.tee 2
                    i32.const 3
                    i32.and
                    i32.const 3
                    i32.ne
                    br_if 4 (;@4;)
                    local.get 3
                    i32.const 4
                    i32.add
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store
                    i32.const 0
                    local.get 0
                    i32.store offset=3416
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    return
                  end
                  local.get 1
                  i32.load offset=24
                  local.set 6
                  local.get 1
                  i32.load offset=12
                  local.tee 5
                  local.get 1
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 1
                  i32.load offset=8
                  local.tee 2
                  local.get 5
                  i32.store offset=12
                  local.get 5
                  local.get 2
                  i32.store offset=8
                  local.get 6
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=3408
                i32.const -2
                local.get 2
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=3408
                local.get 1
                local.get 3
                i32.lt_u
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 5
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 5
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                local.get 6
                i32.eqz
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              i32.const 0
              local.set 5
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load offset=28
                  local.tee 4
                  i32.const 2
                  i32.shl
                  i32.const 3712
                  i32.add
                  local.tee 2
                  i32.load
                  local.get 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 1
                  i32.eq
                  select
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 5
              local.get 6
              i32.store offset=24
              block  ;; label = @6
                local.get 1
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.store offset=16
                local.get 2
                local.get 5
                i32.store offset=24
              end
              local.get 1
              i32.const 20
              i32.add
              i32.load
              local.tee 2
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              i32.const 20
              i32.add
              local.get 2
              i32.store
              local.get 2
              local.get 5
              i32.store offset=24
              local.get 1
              local.get 3
              i32.lt_u
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=3412
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=3412
          end
          local.get 1
          local.get 3
          i32.ge_u
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 2
                          i32.const 2
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=3432
                          local.get 3
                          i32.eq
                          br_if 1 (;@10;)
                          i32.const 0
                          i32.load offset=3428
                          local.get 3
                          i32.eq
                          br_if 2 (;@9;)
                          local.get 2
                          i32.const -8
                          i32.and
                          local.get 0
                          i32.add
                          local.set 0
                          local.get 2
                          i32.const 255
                          i32.gt_u
                          br_if 3 (;@8;)
                          local.get 3
                          i32.load offset=12
                          local.tee 4
                          local.get 3
                          i32.load offset=8
                          local.tee 5
                          i32.eq
                          br_if 4 (;@7;)
                          local.get 4
                          local.get 5
                          i32.store offset=8
                          local.get 5
                          local.get 4
                          i32.store offset=12
                          br 7 (;@4;)
                        end
                        local.get 3
                        i32.const 4
                        i32.add
                        local.get 2
                        i32.const -2
                        i32.and
                        i32.store
                        local.get 1
                        local.get 0
                        i32.add
                        local.get 0
                        i32.store
                        local.get 1
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 7 (;@3;)
                      end
                      i32.const 0
                      local.get 1
                      i32.store offset=3432
                      i32.const 0
                      i32.const 0
                      i32.load offset=3420
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=3420
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      i32.const 0
                      i32.load offset=3428
                      i32.ne
                      br_if 7 (;@2;)
                      i32.const 0
                      i32.const 0
                      i32.store offset=3416
                      i32.const 0
                      i32.const 0
                      i32.store offset=3428
                      return
                    end
                    i32.const 0
                    local.get 1
                    i32.store offset=3428
                    i32.const 0
                    i32.const 0
                    i32.load offset=3416
                    local.get 0
                    i32.add
                    local.tee 0
                    i32.store offset=3416
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                    return
                  end
                  local.get 3
                  i32.load offset=24
                  local.set 6
                  local.get 3
                  i32.load offset=12
                  local.tee 5
                  local.get 3
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 3
                  i32.load offset=8
                  local.tee 2
                  local.get 5
                  i32.store offset=12
                  local.get 5
                  local.get 2
                  i32.store offset=8
                  local.get 6
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=3408
                i32.const -2
                local.get 2
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=3408
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 5
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 5
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                local.get 6
                i32.eqz
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              i32.const 0
              local.set 5
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load offset=28
                  local.tee 4
                  i32.const 2
                  i32.shl
                  i32.const 3712
                  i32.add
                  local.tee 2
                  i32.load
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 3
                  i32.eq
                  select
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 5
              local.get 6
              i32.store offset=24
              block  ;; label = @6
                local.get 3
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.store offset=16
                local.get 2
                local.get 5
                i32.store offset=24
              end
              local.get 3
              i32.const 20
              i32.add
              i32.load
              local.tee 2
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              i32.const 20
              i32.add
              local.get 2
              i32.store
              local.get 2
              local.get 5
              i32.store offset=24
              br 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=3412
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=3412
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=3428
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 0
          i32.store offset=3416
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 3
                      i32.shr_u
                      local.tee 2
                      i32.const 3
                      i32.shl
                      i32.const 3448
                      i32.add
                      local.set 0
                      i32.const 0
                      i32.load offset=3408
                      local.tee 4
                      i32.const 1
                      local.get 2
                      i32.shl
                      local.tee 2
                      i32.and
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 0
                      i32.load offset=8
                      local.set 2
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 2
                    block  ;; label = @9
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 2
                      local.get 0
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 14
                      local.get 4
                      local.get 4
                      i32.const 1048320
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 8
                      i32.and
                      local.tee 2
                      i32.shl
                      local.tee 4
                      i32.const 520192
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 4
                      i32.and
                      local.tee 5
                      local.get 2
                      i32.or
                      local.get 4
                      local.get 5
                      i32.shl
                      local.tee 2
                      i32.const 245760
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 2
                      i32.and
                      local.tee 4
                      i32.or
                      i32.sub
                      local.get 2
                      local.get 4
                      i32.shl
                      i32.const 15
                      i32.shr_u
                      i32.add
                      local.tee 2
                      i32.const 7
                      i32.add
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 2
                      i32.const 1
                      i32.shl
                      i32.or
                      local.set 2
                    end
                    local.get 1
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 1
                    i32.const 28
                    i32.add
                    local.get 2
                    i32.store
                    local.get 2
                    i32.const 2
                    i32.shl
                    i32.const 3712
                    i32.add
                    local.set 4
                    i32.const 0
                    i32.load offset=3412
                    local.tee 5
                    i32.const 1
                    local.get 2
                    i32.shl
                    local.tee 3
                    i32.and
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 2
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 2
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 2
                    local.get 4
                    i32.load
                    local.set 5
                    loop  ;; label = @9
                      local.get 5
                      local.tee 4
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 5 (;@4;)
                      local.get 2
                      i32.const 29
                      i32.shr_u
                      local.set 5
                      local.get 2
                      i32.const 1
                      i32.shl
                      local.set 2
                      local.get 4
                      local.get 5
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 3
                      i32.load
                      local.tee 5
                      br_if 0 (;@9;)
                    end
                    local.get 3
                    local.get 1
                    i32.store
                    local.get 1
                    i32.const 24
                    i32.add
                    local.get 4
                    i32.store
                    br 3 (;@5;)
                  end
                  i32.const 0
                  local.get 4
                  local.get 2
                  i32.or
                  i32.store offset=3408
                  local.get 0
                  local.set 2
                end
                local.get 2
                local.get 1
                i32.store offset=12
                local.get 0
                local.get 1
                i32.store offset=8
                local.get 1
                local.get 0
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                return
              end
              local.get 4
              local.get 1
              i32.store
              i32.const 0
              local.get 5
              local.get 3
              i32.or
              i32.store offset=3412
              local.get 1
              i32.const 24
              i32.add
              local.get 4
              i32.store
            end
            local.get 1
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.tee 0
          local.get 1
          i32.store offset=12
          local.get 4
          local.get 1
          i32.store offset=8
          local.get 1
          i32.const 24
          i32.add
          i32.const 0
          i32.store
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 0
          i32.store offset=8
        end
        i32.const 0
        i32.const 0
        i32.load offset=3440
        i32.const -1
        i32.add
        local.tee 1
        i32.store offset=3440
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
      end
      return
    end
    i32.const 3864
    local.set 1
    loop  ;; label = @1
      local.get 1
      i32.load
      local.tee 0
      i32.const 8
      i32.add
      local.set 1
      local.get 0
      br_if 0 (;@1;)
    end
    i32.const 0
    i32.const -1
    i32.store offset=3440)
  (func $calloc (type 2) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          i32.mul
          local.set 2
          block  ;; label = @4
            local.get 1
            local.get 0
            i32.or
            i32.const 65536
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -1
            local.get 2
            local.get 0
            i32.div_u
            local.get 1
            i32.eq
            select
            local.set 2
          end
          local.get 2
          call $dlmalloc
          local.tee 0
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        call $dlmalloc
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $_Exit (type 3) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $abort (type 7)
    unreachable
    unreachable)
  (func $close (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      i32.store offset=3904
      i32.const -1
      return
    end
    i32.const 0)
  (func $po_map_assertvalid (type 3) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 0
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 0
          i32.load
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          i32.load
          i32.const -1
          i32.le_s
          br_if 2 (;@1;)
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          local.get 1
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      return
    end
    call $abort
    unreachable)
  (func $__wasilibc_init_preopen (type 7)
    (local i32 i32)
    block  ;; label = @1
      i32.const 16
      call $malloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $calloc
      local.tee 1
      i32.store offset=4
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i64.const 4
        i64.store offset=8 align=4
        local.get 0
        i32.const 1
        i32.store
        local.get 0
        call $po_map_assertvalid
        i32.const 0
        local.get 0
        i32.store offset=3908
        local.get 0
        call $po_map_assertvalid
        return
      end
      local.get 0
      call $free
    end
    i32.const 0
    i32.const 0
    i32.store offset=3908
    unreachable
    unreachable)
  (func $__wasilibc_register_preopened_fd (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    i32.load offset=3908
    call $po_map_assertvalid
    i32.const -1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=3908
      local.tee 4
      call $po_map_assertvalid
      local.get 0
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load offset=12
          local.tee 5
          local.get 4
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          i32.const 24
          local.get 5
          i32.const 1
          i32.shl
          call $calloc
          local.tee 6
          i32.eqz
          br_if 2 (;@1;)
          local.get 6
          local.get 4
          i32.load offset=4
          local.get 4
          i32.const 12
          i32.add
          local.tee 5
          i32.load
          i32.const 24
          i32.mul
          call $memcpy
          drop
          local.get 4
          i32.load offset=4
          call $free
          local.get 4
          local.get 6
          i32.store offset=4
          local.get 4
          i32.const 8
          i32.add
          local.tee 7
          local.get 7
          i32.load
          i32.const 1
          i32.shl
          i32.store
          local.get 5
          i32.load
          local.set 5
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=4
        local.set 6
      end
      local.get 4
      i32.const 12
      i32.add
      local.get 5
      i32.const 1
      i32.add
      i32.store
      local.get 1
      call $strdup
      local.set 7
      local.get 6
      local.get 5
      i32.const 24
      i32.mul
      i32.add
      local.tee 1
      local.get 0
      i32.store offset=4
      local.get 1
      local.get 7
      i32.store
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.const 8
        i32.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=3904
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i64.load offset=16
      i64.store offset=8
      local.get 1
      local.get 2
      i64.load offset=24
      i64.store offset=16
      local.get 4
      call $po_map_assertvalid
      local.get 4
      call $po_map_assertvalid
      i32.const 0
      local.set 3
      i32.const 0
      local.get 4
      i32.store offset=3908
    end
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 3)
  (func $sbrk (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 16
        i32.shl
        return
      end
      i32.const 0
      i32.const 48
      i32.store offset=3904
      i32.const -1
      return
    end
    call $abort
    unreachable)
  (func $dummy (type 7))
  (func $__prepare_for_exit (type 7)
    call $dummy
    call $__stdio_exit)
  (func $__stdio_close (type 4) (param i32) (result i32)
    local.get 0
    i32.load offset=56
    call $close)
  (func $lseek (type 1) (param i32 i64 i32) (result i64)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i32.const 8
        i32.add
        call $__wasi_fd_seek
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 70
        local.get 0
        local.get 0
        i32.const 76
        i32.eq
        select
        i32.store offset=3904
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $__stdio_seek (type 1) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=56
    local.get 1
    local.get 2
    call $lseek)
  (func $strerror (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block  ;; label = @1
      i32.const 0
      i32.load offset=4976
      local.tee 2
      br_if 0 (;@1;)
      i32.const 4952
      local.set 2
      i32.const 0
      i32.const 4952
      i32.store offset=4976
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              i32.const 1056
              i32.add
              i32.load8_u
              local.get 0
              i32.eq
              br_if 1 (;@4;)
              i32.const 77
              local.set 3
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              i32.const 77
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 1
          local.set 3
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1136
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.load8_u
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.tee 4
          local.set 1
          local.get 0
          br_if 0 (;@3;)
          local.get 4
          local.set 1
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 1136
      local.set 4
    end
    local.get 4
    local.get 2
    i32.load offset=20
    call $__lctrans)
  (func $fputs (type 2) (param i32 i32) (result i32)
    (local i32)
    i32.const -1
    i32.const 0
    local.get 0
    call $strlen
    local.tee 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $vfprintf (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 208
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    i32.store offset=204
    local.get 3
    i32.const 160
    i32.add
    i32.const 32
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 184
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 176
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=168
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 3
    i32.load offset=204
    i32.store offset=200
    i32.const -1
    local.set 2
    block  ;; label = @1
      i32.const 0
      local.get 1
      local.get 3
      i32.const 200
      i32.add
      local.get 3
      i32.const 80
      i32.add
      local.get 3
      i32.const 160
      i32.add
      call $printf_core
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=60
                  i32.const 0
                  i32.le_s
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=44
                  i32.eqz
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                local.get 0
                local.get 4
                i32.const -33
                i32.and
                i32.store
                local.get 0
                i32.load offset=44
                br_if 1 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i32.const 44
              i32.add
              i32.const 80
              i32.store
              local.get 0
              i32.load offset=40
              local.set 5
              local.get 0
              local.get 3
              i32.store offset=40
              br 1 (;@4;)
            end
            i32.const 0
            local.set 5
            local.get 0
            i32.load offset=16
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 2
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        local.set 2
      end
      local.get 4
      i32.const 32
      i32.and
      local.set 1
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
        local.get 0
        i32.const 44
        i32.add
        i32.const 0
        i32.store
        local.get 0
        local.get 5
        i32.store offset=40
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i32.const 16
        i32.add
        i32.const 0
        i32.store
        local.get 0
        i32.load offset=20
        local.set 5
        local.get 0
        i32.const 0
        i32.store offset=20
        local.get 2
        i32.const -1
        local.get 5
        select
        local.set 2
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 5
      local.get 1
      i32.or
      i32.store
      i32.const -1
      local.get 2
      local.get 5
      i32.const 32
      i32.and
      select
      local.set 2
    end
    local.get 3
    i32.const 208
    i32.add
    global.set 0
    local.get 2)
  (func $printf_core (type 8) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 f64 i32 f64 i32 i64 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 880
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 336
    i32.add
    i32.const 8
    i32.or
    local.set 6
    local.get 5
    i32.const 16
    i32.add
    i32.const 39
    i32.add
    local.set 7
    i32.const -2
    local.get 5
    i32.const 336
    i32.add
    i32.sub
    local.set 8
    local.get 5
    i32.const 336
    i32.add
    i32.const 9
    i32.or
    local.set 9
    local.get 5
    i32.const 656
    i32.add
    local.set 10
    local.get 5
    i32.const 324
    i32.add
    i32.const 12
    i32.add
    local.set 11
    local.get 5
    i32.const 56
    i32.add
    local.set 12
    i32.const 0
    local.set 13
    i32.const 0
    local.set 14
    i32.const 0
    local.set 15
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            local.set 18
            local.get 15
            i32.const 2147483647
            local.get 14
            i32.sub
            i32.gt_s
            br_if 1 (;@3;)
            local.get 15
            local.get 14
            i32.add
            local.set 14
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                local.get 18
                                                                i32.load8_u
                                                                local.tee 15
                                                                i32.eqz
                                                                br_if 0 (;@30;)
                                                                local.get 18
                                                                local.set 1
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      local.get 15
                                                                      i32.const 255
                                                                      i32.and
                                                                      local.tee 15
                                                                      i32.eqz
                                                                      br_if 0 (;@33;)
                                                                      loop  ;; label = @34
                                                                        local.get 15
                                                                        i32.const 37
                                                                        i32.eq
                                                                        br_if 2 (;@32;)
                                                                        local.get 1
                                                                        i32.load8_u offset=1
                                                                        local.set 15
                                                                        local.get 1
                                                                        i32.const 1
                                                                        i32.add
                                                                        local.set 1
                                                                        local.get 15
                                                                        i32.const 255
                                                                        i32.and
                                                                        local.tee 15
                                                                        br_if 0 (;@34;)
                                                                      end
                                                                    end
                                                                    local.get 1
                                                                    local.set 17
                                                                    br 1 (;@31;)
                                                                  end
                                                                  local.get 1
                                                                  local.set 17
                                                                  local.get 1
                                                                  local.set 15
                                                                  block  ;; label = @32
                                                                    loop  ;; label = @33
                                                                      local.get 15
                                                                      i32.const 1
                                                                      i32.add
                                                                      i32.load8_u
                                                                      i32.const 37
                                                                      i32.ne
                                                                      br_if 1 (;@32;)
                                                                      local.get 17
                                                                      i32.const 1
                                                                      i32.add
                                                                      local.set 17
                                                                      local.get 15
                                                                      i32.load8_u offset=2
                                                                      local.set 19
                                                                      local.get 15
                                                                      i32.const 2
                                                                      i32.add
                                                                      local.tee 1
                                                                      local.set 15
                                                                      local.get 19
                                                                      i32.const 37
                                                                      i32.eq
                                                                      br_if 0 (;@33;)
                                                                      br 2 (;@31;)
                                                                    end
                                                                  end
                                                                  local.get 15
                                                                  local.set 1
                                                                end
                                                                local.get 17
                                                                local.get 18
                                                                i32.sub
                                                                local.tee 15
                                                                i32.const 2147483647
                                                                local.get 14
                                                                i32.sub
                                                                local.tee 17
                                                                i32.gt_s
                                                                br_if 27 (;@3;)
                                                                block  ;; label = @31
                                                                  local.get 0
                                                                  i32.eqz
                                                                  br_if 0 (;@31;)
                                                                  local.get 0
                                                                  i32.load8_u
                                                                  i32.const 32
                                                                  i32.and
                                                                  br_if 0 (;@31;)
                                                                  local.get 18
                                                                  local.get 15
                                                                  local.get 0
                                                                  call $__fwritex
                                                                  drop
                                                                end
                                                                local.get 15
                                                                br_if 26 (;@4;)
                                                                local.get 1
                                                                i32.const 1
                                                                i32.add
                                                                local.set 15
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    local.get 1
                                                                    i32.load8_s offset=1
                                                                    local.tee 16
                                                                    i32.const -48
                                                                    i32.add
                                                                    local.tee 20
                                                                    i32.const 9
                                                                    i32.gt_u
                                                                    br_if 0 (;@32;)
                                                                    local.get 1
                                                                    i32.const 3
                                                                    i32.add
                                                                    local.get 15
                                                                    local.get 1
                                                                    i32.load8_u offset=2
                                                                    i32.const 36
                                                                    i32.eq
                                                                    local.tee 19
                                                                    select
                                                                    local.set 15
                                                                    local.get 20
                                                                    i32.const -1
                                                                    local.get 19
                                                                    select
                                                                    local.set 21
                                                                    i32.const 1
                                                                    local.get 13
                                                                    local.get 19
                                                                    select
                                                                    local.set 13
                                                                    local.get 1
                                                                    i32.const 3
                                                                    i32.const 1
                                                                    local.get 19
                                                                    select
                                                                    i32.add
                                                                    i32.load8_s
                                                                    local.set 16
                                                                    br 1 (;@31;)
                                                                  end
                                                                  i32.const -1
                                                                  local.set 21
                                                                end
                                                                i32.const 0
                                                                local.set 22
                                                                block  ;; label = @31
                                                                  local.get 16
                                                                  i32.const -32
                                                                  i32.add
                                                                  local.tee 1
                                                                  i32.const 31
                                                                  i32.gt_u
                                                                  br_if 0 (;@31;)
                                                                  i32.const 1
                                                                  local.get 1
                                                                  i32.shl
                                                                  local.tee 1
                                                                  i32.const 75913
                                                                  i32.and
                                                                  i32.eqz
                                                                  br_if 0 (;@31;)
                                                                  local.get 15
                                                                  i32.const 1
                                                                  i32.add
                                                                  local.set 19
                                                                  i32.const 0
                                                                  local.set 22
                                                                  loop  ;; label = @32
                                                                    local.get 1
                                                                    local.get 22
                                                                    i32.or
                                                                    local.set 22
                                                                    local.get 19
                                                                    local.tee 15
                                                                    i32.load8_s
                                                                    local.tee 16
                                                                    i32.const -32
                                                                    i32.add
                                                                    local.tee 1
                                                                    i32.const 32
                                                                    i32.ge_u
                                                                    br_if 1 (;@31;)
                                                                    local.get 15
                                                                    i32.const 1
                                                                    i32.add
                                                                    local.set 19
                                                                    i32.const 1
                                                                    local.get 1
                                                                    i32.shl
                                                                    local.tee 1
                                                                    i32.const 75913
                                                                    i32.and
                                                                    br_if 0 (;@32;)
                                                                  end
                                                                end
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            local.get 16
                                                                            i32.const 42
                                                                            i32.ne
                                                                            br_if 0 (;@36;)
                                                                            local.get 15
                                                                            i32.load8_s offset=1
                                                                            i32.const -48
                                                                            i32.add
                                                                            local.tee 1
                                                                            i32.const 9
                                                                            i32.gt_u
                                                                            br_if 1 (;@35;)
                                                                            local.get 15
                                                                            i32.load8_u offset=2
                                                                            i32.const 36
                                                                            i32.ne
                                                                            br_if 1 (;@35;)
                                                                            local.get 4
                                                                            local.get 1
                                                                            i32.const 2
                                                                            i32.shl
                                                                            i32.add
                                                                            i32.const 10
                                                                            i32.store
                                                                            local.get 15
                                                                            i32.const 3
                                                                            i32.add
                                                                            local.set 23
                                                                            i32.const 1
                                                                            local.set 13
                                                                            local.get 3
                                                                            local.get 15
                                                                            i32.const 1
                                                                            i32.add
                                                                            i32.load8_s
                                                                            i32.const 3
                                                                            i32.shl
                                                                            i32.add
                                                                            i32.const -384
                                                                            i32.add
                                                                            i32.load
                                                                            local.tee 20
                                                                            i32.const -1
                                                                            i32.gt_s
                                                                            br_if 5 (;@31;)
                                                                            br 2 (;@34;)
                                                                          end
                                                                          i32.const 0
                                                                          local.set 20
                                                                          local.get 16
                                                                          i32.const -48
                                                                          i32.add
                                                                          local.tee 19
                                                                          i32.const 9
                                                                          i32.gt_u
                                                                          br_if 2 (;@33;)
                                                                          i32.const 0
                                                                          local.set 1
                                                                          loop  ;; label = @36
                                                                            i32.const -1
                                                                            local.set 20
                                                                            block  ;; label = @37
                                                                              local.get 1
                                                                              i32.const 214748364
                                                                              i32.gt_u
                                                                              br_if 0 (;@37;)
                                                                              i32.const -1
                                                                              local.get 1
                                                                              i32.const 10
                                                                              i32.mul
                                                                              local.tee 1
                                                                              local.get 19
                                                                              i32.add
                                                                              local.get 19
                                                                              i32.const 2147483647
                                                                              local.get 1
                                                                              i32.sub
                                                                              i32.gt_s
                                                                              select
                                                                              local.set 20
                                                                            end
                                                                            local.get 15
                                                                            i32.load8_s offset=1
                                                                            local.set 19
                                                                            local.get 15
                                                                            i32.const 1
                                                                            i32.add
                                                                            local.tee 23
                                                                            local.set 15
                                                                            local.get 20
                                                                            local.set 1
                                                                            local.get 19
                                                                            i32.const -48
                                                                            i32.add
                                                                            local.tee 19
                                                                            i32.const 10
                                                                            i32.lt_u
                                                                            br_if 0 (;@36;)
                                                                          end
                                                                          local.get 20
                                                                          i32.const 0
                                                                          i32.ge_s
                                                                          br_if 4 (;@31;)
                                                                          br 32 (;@3;)
                                                                        end
                                                                        local.get 13
                                                                        br_if 16 (;@18;)
                                                                        local.get 15
                                                                        i32.const 1
                                                                        i32.add
                                                                        local.set 23
                                                                        local.get 0
                                                                        i32.eqz
                                                                        br_if 2 (;@32;)
                                                                        local.get 2
                                                                        local.get 2
                                                                        i32.load
                                                                        local.tee 1
                                                                        i32.const 4
                                                                        i32.add
                                                                        i32.store
                                                                        i32.const 0
                                                                        local.set 13
                                                                        local.get 1
                                                                        i32.load
                                                                        local.tee 20
                                                                        i32.const -1
                                                                        i32.gt_s
                                                                        br_if 3 (;@31;)
                                                                      end
                                                                      i32.const 0
                                                                      local.get 20
                                                                      i32.sub
                                                                      local.set 20
                                                                      local.get 22
                                                                      i32.const 8192
                                                                      i32.or
                                                                      local.set 22
                                                                      br 2 (;@31;)
                                                                    end
                                                                    local.get 15
                                                                    local.set 23
                                                                    br 1 (;@31;)
                                                                  end
                                                                  i32.const 0
                                                                  local.set 13
                                                                  i32.const 0
                                                                  local.set 20
                                                                end
                                                                i32.const 0
                                                                local.set 15
                                                                i32.const -1
                                                                local.set 16
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              local.get 23
                                                                              i32.load8_u
                                                                              i32.const 46
                                                                              i32.ne
                                                                              br_if 0 (;@37;)
                                                                              local.get 23
                                                                              i32.load8_s offset=1
                                                                              local.tee 19
                                                                              i32.const 42
                                                                              i32.ne
                                                                              br_if 1 (;@36;)
                                                                              local.get 23
                                                                              i32.load8_s offset=2
                                                                              i32.const -48
                                                                              i32.add
                                                                              local.tee 1
                                                                              i32.const 9
                                                                              i32.gt_u
                                                                              br_if 2 (;@35;)
                                                                              local.get 23
                                                                              i32.load8_u offset=3
                                                                              i32.const 36
                                                                              i32.ne
                                                                              br_if 2 (;@35;)
                                                                              local.get 4
                                                                              local.get 1
                                                                              i32.const 2
                                                                              i32.shl
                                                                              i32.add
                                                                              i32.const 10
                                                                              i32.store
                                                                              local.get 23
                                                                              i32.const 4
                                                                              i32.add
                                                                              local.set 1
                                                                              local.get 3
                                                                              local.get 23
                                                                              i32.const 2
                                                                              i32.add
                                                                              i32.load8_s
                                                                              i32.const 3
                                                                              i32.shl
                                                                              i32.add
                                                                              i32.const -384
                                                                              i32.add
                                                                              i32.load
                                                                              local.set 16
                                                                              br 5 (;@32;)
                                                                            end
                                                                            local.get 23
                                                                            local.set 1
                                                                            i32.const 0
                                                                            local.set 24
                                                                            br 5 (;@31;)
                                                                          end
                                                                          local.get 23
                                                                          i32.const 1
                                                                          i32.add
                                                                          local.set 1
                                                                          local.get 19
                                                                          i32.const -48
                                                                          i32.add
                                                                          local.tee 25
                                                                          i32.const 9
                                                                          i32.gt_u
                                                                          br_if 1 (;@34;)
                                                                          i32.const 0
                                                                          local.set 23
                                                                          local.get 1
                                                                          local.set 19
                                                                          loop  ;; label = @36
                                                                            i32.const -1
                                                                            local.set 16
                                                                            block  ;; label = @37
                                                                              local.get 23
                                                                              i32.const 214748364
                                                                              i32.gt_u
                                                                              br_if 0 (;@37;)
                                                                              i32.const -1
                                                                              local.get 23
                                                                              i32.const 10
                                                                              i32.mul
                                                                              local.tee 1
                                                                              local.get 25
                                                                              i32.add
                                                                              local.get 25
                                                                              i32.const 2147483647
                                                                              local.get 1
                                                                              i32.sub
                                                                              i32.gt_s
                                                                              select
                                                                              local.set 16
                                                                            end
                                                                            i32.const 1
                                                                            local.set 24
                                                                            local.get 19
                                                                            i32.load8_s offset=1
                                                                            local.set 25
                                                                            local.get 19
                                                                            i32.const 1
                                                                            i32.add
                                                                            local.tee 1
                                                                            local.set 19
                                                                            local.get 16
                                                                            local.set 23
                                                                            local.get 25
                                                                            i32.const -48
                                                                            i32.add
                                                                            local.tee 25
                                                                            i32.const 10
                                                                            i32.lt_u
                                                                            br_if 0 (;@36;)
                                                                            br 5 (;@31;)
                                                                          end
                                                                        end
                                                                        local.get 13
                                                                        br_if 16 (;@18;)
                                                                        local.get 23
                                                                        i32.const 2
                                                                        i32.add
                                                                        local.set 1
                                                                        local.get 0
                                                                        i32.eqz
                                                                        br_if 1 (;@33;)
                                                                        local.get 2
                                                                        local.get 2
                                                                        i32.load
                                                                        local.tee 19
                                                                        i32.const 4
                                                                        i32.add
                                                                        i32.store
                                                                        local.get 19
                                                                        i32.load
                                                                        local.set 16
                                                                        br 2 (;@32;)
                                                                      end
                                                                      i32.const 1
                                                                      local.set 24
                                                                      i32.const 0
                                                                      local.set 16
                                                                      br 2 (;@31;)
                                                                    end
                                                                    i32.const 0
                                                                    local.set 16
                                                                  end
                                                                  local.get 16
                                                                  i32.const -1
                                                                  i32.xor
                                                                  i32.const 31
                                                                  i32.shr_u
                                                                  local.set 24
                                                                end
                                                                loop  ;; label = @31
                                                                  local.get 15
                                                                  local.set 19
                                                                  local.get 1
                                                                  i32.load8_s
                                                                  i32.const -65
                                                                  i32.add
                                                                  local.tee 15
                                                                  i32.const 57
                                                                  i32.gt_u
                                                                  br_if 13 (;@18;)
                                                                  local.get 1
                                                                  i32.const 1
                                                                  i32.add
                                                                  local.set 1
                                                                  local.get 19
                                                                  i32.const 58
                                                                  i32.mul
                                                                  local.get 15
                                                                  i32.add
                                                                  i32.const 2736
                                                                  i32.add
                                                                  i32.load8_u
                                                                  local.tee 15
                                                                  i32.const -1
                                                                  i32.add
                                                                  i32.const 8
                                                                  i32.lt_u
                                                                  br_if 0 (;@31;)
                                                                end
                                                                local.get 15
                                                                i32.eqz
                                                                br_if 12 (;@18;)
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        local.get 15
                                                                        i32.const 27
                                                                        i32.ne
                                                                        br_if 0 (;@34;)
                                                                        local.get 21
                                                                        i32.const -1
                                                                        i32.le_s
                                                                        br_if 1 (;@33;)
                                                                        br 16 (;@18;)
                                                                      end
                                                                      local.get 21
                                                                      i32.const 0
                                                                      i32.lt_s
                                                                      br_if 1 (;@32;)
                                                                      local.get 4
                                                                      local.get 21
                                                                      i32.const 2
                                                                      i32.shl
                                                                      i32.add
                                                                      local.get 15
                                                                      i32.store
                                                                      local.get 5
                                                                      local.get 3
                                                                      local.get 21
                                                                      i32.const 3
                                                                      i32.shl
                                                                      i32.add
                                                                      i64.load
                                                                      i64.store offset=56
                                                                    end
                                                                    i32.const 0
                                                                    local.set 15
                                                                    local.get 0
                                                                    i32.eqz
                                                                    br_if 28 (;@4;)
                                                                    br 1 (;@31;)
                                                                  end
                                                                  local.get 0
                                                                  i32.eqz
                                                                  br_if 2 (;@29;)
                                                                  local.get 5
                                                                  i32.const 56
                                                                  i32.add
                                                                  local.get 15
                                                                  local.get 2
                                                                  call $pop_arg
                                                                end
                                                                local.get 22
                                                                i32.const -65537
                                                                i32.and
                                                                local.tee 26
                                                                local.get 22
                                                                local.get 22
                                                                i32.const 8192
                                                                i32.and
                                                                select
                                                                local.set 23
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      block  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    block  ;; label = @49
                                                                                                      block  ;; label = @50
                                                                                                        block  ;; label = @51
                                                                                                          block  ;; label = @52
                                                                                                            block  ;; label = @53
                                                                                                              block  ;; label = @54
                                                                                                                block  ;; label = @55
                                                                                                                  block  ;; label = @56
                                                                                                                    block  ;; label = @57
                                                                                                                      block  ;; label = @58
                                                                                                                        block  ;; label = @59
                                                                                                                          block  ;; label = @60
                                                                                                                            block  ;; label = @61
                                                                                                                              block  ;; label = @62
                                                                                                                                block  ;; label = @63
                                                                                                                                  block  ;; label = @64
                                                                                                                                    block  ;; label = @65
                                                                                                                                      local.get 1
                                                                                                                                      i32.const -1
                                                                                                                                      i32.add
                                                                                                                                      i32.load8_s
                                                                                                                                      local.tee 15
                                                                                                                                      i32.const -33
                                                                                                                                      i32.and
                                                                                                                                      local.get 15
                                                                                                                                      local.get 15
                                                                                                                                      i32.const 15
                                                                                                                                      i32.and
                                                                                                                                      i32.const 3
                                                                                                                                      i32.eq
                                                                                                                                      select
                                                                                                                                      local.get 15
                                                                                                                                      local.get 19
                                                                                                                                      select
                                                                                                                                      local.tee 25
                                                                                                                                      i32.const -65
                                                                                                                                      i32.add
                                                                                                                                      local.tee 15
                                                                                                                                      i32.const 55
                                                                                                                                      i32.gt_u
                                                                                                                                      br_if 0 (;@65;)
                                                                                                                                      block  ;; label = @66
                                                                                                                                        block  ;; label = @67
                                                                                                                                          local.get 15
                                                                                                                                          br_table 0 (;@67;) 2 (;@65;) 3 (;@64;) 2 (;@65;) 0 (;@67;) 0 (;@67;) 0 (;@67;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 4 (;@63;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 11 (;@56;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 0 (;@67;) 2 (;@65;) 6 (;@61;) 1 (;@66;) 0 (;@67;) 0 (;@67;) 0 (;@67;) 2 (;@65;) 1 (;@66;) 2 (;@65;) 2 (;@65;) 2 (;@65;) 7 (;@60;) 8 (;@59;) 9 (;@58;) 10 (;@57;) 2 (;@65;) 2 (;@65;) 12 (;@55;) 2 (;@65;) 14 (;@53;) 2 (;@65;) 2 (;@65;) 11 (;@56;) 0 (;@67;)
                                                                                                                                        end
                                                                                                                                        block  ;; label = @67
                                                                                                                                          local.get 16
                                                                                                                                          i32.const -1
                                                                                                                                          i32.gt_s
                                                                                                                                          br_if 0 (;@67;)
                                                                                                                                          local.get 24
                                                                                                                                          br_if 64 (;@3;)
                                                                                                                                        end
                                                                                                                                        local.get 5
                                                                                                                                        f64.load offset=56
                                                                                                                                        local.set 27
                                                                                                                                        local.get 5
                                                                                                                                        i32.const 0
                                                                                                                                        i32.store offset=364
                                                                                                                                        block  ;; label = @67
                                                                                                                                          block  ;; label = @68
                                                                                                                                            block  ;; label = @69
                                                                                                                                              local.get 27
                                                                                                                                              i64.reinterpret_f64
                                                                                                                                              i64.const -1
                                                                                                                                              i64.le_s
                                                                                                                                              br_if 0 (;@69;)
                                                                                                                                              local.get 23
                                                                                                                                              i32.const 2048
                                                                                                                                              i32.and
                                                                                                                                              br_if 1 (;@68;)
                                                                                                                                              i32.const 3366
                                                                                                                                              i32.const 3361
                                                                                                                                              local.get 23
                                                                                                                                              i32.const 1
                                                                                                                                              i32.and
                                                                                                                                              local.tee 26
                                                                                                                                              select
                                                                                                                                              local.set 28
                                                                                                                                              br 2 (;@67;)
                                                                                                                                            end
                                                                                                                                            local.get 27
                                                                                                                                            f64.neg
                                                                                                                                            local.set 27
                                                                                                                                            i32.const 1
                                                                                                                                            local.set 26
                                                                                                                                            i32.const 3360
                                                                                                                                            local.set 28
                                                                                                                                            br 1 (;@67;)
                                                                                                                                          end
                                                                                                                                          i32.const 1
                                                                                                                                          local.set 26
                                                                                                                                          i32.const 3363
                                                                                                                                          local.set 28
                                                                                                                                        end
                                                                                                                                        block  ;; label = @67
                                                                                                                                          block  ;; label = @68
                                                                                                                                            local.get 27
                                                                                                                                            f64.abs
                                                                                                                                            local.tee 29
                                                                                                                                            f64.const inf (;=inf;)
                                                                                                                                            f64.ne
                                                                                                                                            local.get 29
                                                                                                                                            local.get 29
                                                                                                                                            f64.eq
                                                                                                                                            i32.and
                                                                                                                                            i32.eqz
                                                                                                                                            br_if 0 (;@68;)
                                                                                                                                            block  ;; label = @69
                                                                                                                                              local.get 27
                                                                                                                                              local.get 5
                                                                                                                                              i32.const 364
                                                                                                                                              i32.add
                                                                                                                                              call $frexp
                                                                                                                                              local.tee 27
                                                                                                                                              local.get 27
                                                                                                                                              f64.add
                                                                                                                                              local.tee 27
                                                                                                                                              f64.const 0x0p+0 (;=0;)
                                                                                                                                              f64.eq
                                                                                                                                              br_if 0 (;@69;)
                                                                                                                                              local.get 5
                                                                                                                                              local.get 5
                                                                                                                                              i32.load offset=364
                                                                                                                                              i32.const -1
                                                                                                                                              i32.add
                                                                                                                                              i32.store offset=364
                                                                                                                                            end
                                                                                                                                            local.get 25
                                                                                                                                            i32.const 32
                                                                                                                                            i32.or
                                                                                                                                            local.tee 30
                                                                                                                                            i32.const 97
                                                                                                                                            i32.ne
                                                                                                                                            br_if 1 (;@67;)
                                                                                                                                            local.get 28
                                                                                                                                            i32.const 9
                                                                                                                                            i32.add
                                                                                                                                            local.get 28
                                                                                                                                            local.get 25
                                                                                                                                            i32.const 32
                                                                                                                                            i32.and
                                                                                                                                            local.tee 22
                                                                                                                                            select
                                                                                                                                            local.set 28
                                                                                                                                            local.get 16
                                                                                                                                            i32.const 11
                                                                                                                                            i32.gt_u
                                                                                                                                            br_if 25 (;@43;)
                                                                                                                                            i32.const 12
                                                                                                                                            local.get 16
                                                                                                                                            i32.sub
                                                                                                                                            i32.eqz
                                                                                                                                            br_if 25 (;@43;)
                                                                                                                                            local.get 16
                                                                                                                                            i32.const -12
                                                                                                                                            i32.add
                                                                                                                                            local.set 15
                                                                                                                                            f64.const 0x1p+4 (;=16;)
                                                                                                                                            local.set 29
                                                                                                                                            loop  ;; label = @69
                                                                                                                                              local.get 29
                                                                                                                                              f64.const 0x1p+4 (;=16;)
                                                                                                                                              f64.mul
                                                                                                                                              local.set 29
                                                                                                                                              local.get 15
                                                                                                                                              i32.const 1
                                                                                                                                              i32.add
                                                                                                                                              local.tee 15
                                                                                                                                              br_if 0 (;@69;)
                                                                                                                                            end
                                                                                                                                            local.get 28
                                                                                                                                            i32.load8_u
                                                                                                                                            i32.const 45
                                                                                                                                            i32.ne
                                                                                                                                            br_if 24 (;@44;)
                                                                                                                                            local.get 29
                                                                                                                                            local.get 27
                                                                                                                                            f64.neg
                                                                                                                                            local.get 29
                                                                                                                                            f64.sub
                                                                                                                                            f64.add
                                                                                                                                            f64.neg
                                                                                                                                            local.set 27
                                                                                                                                            br 25 (;@43;)
                                                                                                                                          end
                                                                                                                                          local.get 26
                                                                                                                                          i32.const 3
                                                                                                                                          i32.add
                                                                                                                                          local.set 16
                                                                                                                                          local.get 23
                                                                                                                                          i32.const 8192
                                                                                                                                          i32.and
                                                                                                                                          br_if 21 (;@46;)
                                                                                                                                          local.get 20
                                                                                                                                          local.get 16
                                                                                                                                          i32.le_s
                                                                                                                                          br_if 21 (;@46;)
                                                                                                                                          local.get 5
                                                                                                                                          i32.const 64
                                                                                                                                          i32.add
                                                                                                                                          i32.const 32
                                                                                                                                          local.get 20
                                                                                                                                          local.get 16
                                                                                                                                          i32.sub
                                                                                                                                          local.tee 22
                                                                                                                                          i32.const 256
                                                                                                                                          local.get 22
                                                                                                                                          i32.const 256
                                                                                                                                          i32.lt_u
                                                                                                                                          local.tee 15
                                                                                                                                          select
                                                                                                                                          call $memset
                                                                                                                                          drop
                                                                                                                                          local.get 0
                                                                                                                                          i32.load
                                                                                                                                          local.tee 19
                                                                                                                                          i32.const 32
                                                                                                                                          i32.and
                                                                                                                                          local.set 17
                                                                                                                                          local.get 15
                                                                                                                                          br_if 19 (;@48;)
                                                                                                                                          local.get 17
                                                                                                                                          i32.eqz
                                                                                                                                          local.set 15
                                                                                                                                          local.get 22
                                                                                                                                          local.set 17
                                                                                                                                          loop  ;; label = @68
                                                                                                                                            block  ;; label = @69
                                                                                                                                              local.get 15
                                                                                                                                              i32.const 1
                                                                                                                                              i32.and
                                                                                                                                              i32.eqz
                                                                                                                                              br_if 0 (;@69;)
                                                                                                                                              local.get 5
                                                                                                                                              i32.const 64
                                                                                                                                              i32.add
                                                                                                                                              i32.const 256
                                                                                                                                              local.get 0
                                                                                                                                              call $__fwritex
                                                                                                                                              drop
                                                                                                                                              local.get 0
                                                                                                                                              i32.load
                                                                                                                                              local.set 19
                                                                                                                                            end
                                                                                                                                            local.get 19
                                                                                                                                            i32.const 32
                                                                                                                                            i32.and
                                                                                                                                            local.tee 18
                                                                                                                                            i32.eqz
                                                                                                                                            local.set 15
                                                                                                                                            local.get 17
                                                                                                                                            i32.const -256
                                                                                                                                            i32.add
                                                                                                                                            local.tee 17
                                                                                                                                            i32.const 255
                                                                                                                                            i32.gt_u
                                                                                                                                            br_if 0 (;@68;)
                                                                                                                                          end
                                                                                                                                          local.get 18
                                                                                                                                          br_if 21 (;@46;)
                                                                                                                                          local.get 22
                                                                                                                                          i32.const 255
                                                                                                                                          i32.and
                                                                                                                                          local.set 22
                                                                                                                                          br 20 (;@47;)
                                                                                                                                        end
                                                                                                                                        local.get 16
                                                                                                                                        i32.const 0
                                                                                                                                        i32.lt_s
                                                                                                                                        local.set 15
                                                                                                                                        local.get 27
                                                                                                                                        f64.const 0x0p+0 (;=0;)
                                                                                                                                        f64.eq
                                                                                                                                        br_if 14 (;@52;)
                                                                                                                                        local.get 5
                                                                                                                                        local.get 5
                                                                                                                                        i32.load offset=364
                                                                                                                                        i32.const -28
                                                                                                                                        i32.add
                                                                                                                                        local.tee 21
                                                                                                                                        i32.store offset=364
                                                                                                                                        local.get 27
                                                                                                                                        f64.const 0x1p+28 (;=2.68435e+08;)
                                                                                                                                        f64.mul
                                                                                                                                        local.set 27
                                                                                                                                        br 15 (;@51;)
                                                                                                                                      end
                                                                                                                                      local.get 5
                                                                                                                                      i64.load offset=56
                                                                                                                                      local.tee 31
                                                                                                                                      i64.const -1
                                                                                                                                      i64.le_s
                                                                                                                                      br_if 15 (;@50;)
                                                                                                                                      local.get 23
                                                                                                                                      i32.const 2048
                                                                                                                                      i32.and
                                                                                                                                      br_if 20 (;@45;)
                                                                                                                                      i32.const 2712
                                                                                                                                      i32.const 2710
                                                                                                                                      local.get 23
                                                                                                                                      i32.const 1
                                                                                                                                      i32.and
                                                                                                                                      local.tee 21
                                                                                                                                      select
                                                                                                                                      local.set 32
                                                                                                                                      local.get 31
                                                                                                                                      i64.const 4294967296
                                                                                                                                      i64.ge_u
                                                                                                                                      br_if 54 (;@11;)
                                                                                                                                      br 53 (;@12;)
                                                                                                                                    end
                                                                                                                                    i32.const 0
                                                                                                                                    local.set 21
                                                                                                                                    i32.const 2710
                                                                                                                                    local.set 32
                                                                                                                                    br 58 (;@6;)
                                                                                                                                  end
                                                                                                                                  local.get 5
                                                                                                                                  i32.const 8
                                                                                                                                  i32.add
                                                                                                                                  i32.const 4
                                                                                                                                  i32.add
                                                                                                                                  i32.const 0
                                                                                                                                  i32.store
                                                                                                                                  local.get 5
                                                                                                                                  local.get 5
                                                                                                                                  i64.load offset=56
                                                                                                                                  i64.store32 offset=8
                                                                                                                                  local.get 5
                                                                                                                                  local.get 5
                                                                                                                                  i32.const 8
                                                                                                                                  i32.add
                                                                                                                                  i32.store offset=56
                                                                                                                                  i32.const -1
                                                                                                                                  local.set 16
                                                                                                                                  local.get 5
                                                                                                                                  i32.const 8
                                                                                                                                  i32.add
                                                                                                                                  local.set 18
                                                                                                                                  br 1 (;@62;)
                                                                                                                                end
                                                                                                                                local.get 5
                                                                                                                                i32.load offset=56
                                                                                                                                local.set 18
                                                                                                                                local.get 16
                                                                                                                                i32.eqz
                                                                                                                                br_if 22 (;@40;)
                                                                                                                              end
                                                                                                                              i32.const 0
                                                                                                                              local.set 15
                                                                                                                              local.get 18
                                                                                                                              local.set 17
                                                                                                                              loop  ;; label = @62
                                                                                                                                local.get 17
                                                                                                                                i32.load
                                                                                                                                local.tee 19
                                                                                                                                i32.eqz
                                                                                                                                br_if 21 (;@41;)
                                                                                                                                local.get 5
                                                                                                                                i32.const 4
                                                                                                                                i32.add
                                                                                                                                local.get 19
                                                                                                                                call $wctomb
                                                                                                                                local.tee 19
                                                                                                                                i32.const 0
                                                                                                                                i32.lt_s
                                                                                                                                local.tee 22
                                                                                                                                br_if 20 (;@42;)
                                                                                                                                local.get 19
                                                                                                                                local.get 16
                                                                                                                                local.get 15
                                                                                                                                i32.sub
                                                                                                                                i32.gt_u
                                                                                                                                br_if 20 (;@42;)
                                                                                                                                local.get 17
                                                                                                                                i32.const 4
                                                                                                                                i32.add
                                                                                                                                local.set 17
                                                                                                                                local.get 16
                                                                                                                                local.get 19
                                                                                                                                local.get 15
                                                                                                                                i32.add
                                                                                                                                local.tee 15
                                                                                                                                i32.gt_u
                                                                                                                                br_if 0 (;@62;)
                                                                                                                                br 21 (;@41;)
                                                                                                                              end
                                                                                                                            end
                                                                                                                            local.get 5
                                                                                                                            i32.const 16
                                                                                                                            i32.add
                                                                                                                            i32.const 39
                                                                                                                            i32.add
                                                                                                                            local.get 5
                                                                                                                            i64.load offset=56
                                                                                                                            i64.store8
                                                                                                                            i32.const 0
                                                                                                                            local.set 21
                                                                                                                            i32.const 2710
                                                                                                                            local.set 32
                                                                                                                            i32.const 1
                                                                                                                            local.set 16
                                                                                                                            local.get 7
                                                                                                                            local.set 18
                                                                                                                            local.get 12
                                                                                                                            local.set 15
                                                                                                                            local.get 26
                                                                                                                            local.set 23
                                                                                                                            br 55 (;@5;)
                                                                                                                          end
                                                                                                                          i32.const 0
                                                                                                                          i32.load offset=3904
                                                                                                                          call $strerror
                                                                                                                          local.set 18
                                                                                                                          br 5 (;@54;)
                                                                                                                        end
                                                                                                                        i32.const 0
                                                                                                                        local.set 15
                                                                                                                        local.get 19
                                                                                                                        i32.const 255
                                                                                                                        i32.and
                                                                                                                        local.tee 17
                                                                                                                        i32.const 7
                                                                                                                        i32.gt_u
                                                                                                                        br_if 54 (;@4;)
                                                                                                                        block  ;; label = @59
                                                                                                                          local.get 17
                                                                                                                          br_table 0 (;@59;) 23 (;@36;) 24 (;@35;) 25 (;@34;) 26 (;@33;) 55 (;@4;) 27 (;@32;) 28 (;@31;) 0 (;@59;)
                                                                                                                        end
                                                                                                                        local.get 5
                                                                                                                        i32.load offset=56
                                                                                                                        local.get 14
                                                                                                                        i32.store
                                                                                                                        br 54 (;@4;)
                                                                                                                      end
                                                                                                                      local.get 12
                                                                                                                      local.set 18
                                                                                                                      block  ;; label = @58
                                                                                                                        local.get 5
                                                                                                                        i64.load offset=56
                                                                                                                        local.tee 31
                                                                                                                        i64.eqz
                                                                                                                        br_if 0 (;@58;)
                                                                                                                        local.get 12
                                                                                                                        local.set 18
                                                                                                                        loop  ;; label = @59
                                                                                                                          local.get 18
                                                                                                                          i32.const -1
                                                                                                                          i32.add
                                                                                                                          local.tee 18
                                                                                                                          local.get 31
                                                                                                                          i32.wrap_i64
                                                                                                                          i32.const 7
                                                                                                                          i32.and
                                                                                                                          i32.const 48
                                                                                                                          i32.or
                                                                                                                          i32.store8
                                                                                                                          local.get 31
                                                                                                                          i64.const 3
                                                                                                                          i64.shr_u
                                                                                                                          local.tee 31
                                                                                                                          i64.const 0
                                                                                                                          i64.ne
                                                                                                                          br_if 0 (;@59;)
                                                                                                                        end
                                                                                                                      end
                                                                                                                      i32.const 0
                                                                                                                      local.set 21
                                                                                                                      i32.const 2710
                                                                                                                      local.set 32
                                                                                                                      local.get 23
                                                                                                                      i32.const 8
                                                                                                                      i32.and
                                                                                                                      i32.eqz
                                                                                                                      br_if 48 (;@9;)
                                                                                                                      local.get 16
                                                                                                                      local.get 12
                                                                                                                      local.get 18
                                                                                                                      i32.sub
                                                                                                                      local.tee 15
                                                                                                                      i32.const 1
                                                                                                                      i32.add
                                                                                                                      local.get 16
                                                                                                                      local.get 15
                                                                                                                      i32.gt_s
                                                                                                                      select
                                                                                                                      local.set 16
                                                                                                                      local.get 24
                                                                                                                      br_if 49 (;@8;)
                                                                                                                      br 50 (;@7;)
                                                                                                                    end
                                                                                                                    local.get 16
                                                                                                                    i32.const 8
                                                                                                                    local.get 16
                                                                                                                    i32.const 8
                                                                                                                    i32.gt_u
                                                                                                                    select
                                                                                                                    local.set 16
                                                                                                                    local.get 23
                                                                                                                    i32.const 8
                                                                                                                    i32.or
                                                                                                                    local.set 23
                                                                                                                    i32.const 120
                                                                                                                    local.set 25
                                                                                                                  end
                                                                                                                  i32.const 0
                                                                                                                  local.set 21
                                                                                                                  i32.const 2710
                                                                                                                  local.set 32
                                                                                                                  block  ;; label = @56
                                                                                                                    local.get 5
                                                                                                                    i64.load offset=56
                                                                                                                    local.tee 31
                                                                                                                    i64.eqz
                                                                                                                    br_if 0 (;@56;)
                                                                                                                    local.get 25
                                                                                                                    i32.const 32
                                                                                                                    i32.and
                                                                                                                    local.set 15
                                                                                                                    local.get 12
                                                                                                                    local.set 18
                                                                                                                    loop  ;; label = @57
                                                                                                                      local.get 18
                                                                                                                      i32.const -1
                                                                                                                      i32.add
                                                                                                                      local.tee 18
                                                                                                                      local.get 31
                                                                                                                      i32.wrap_i64
                                                                                                                      i32.const 15
                                                                                                                      i32.and
                                                                                                                      i32.const 3344
                                                                                                                      i32.add
                                                                                                                      i32.load8_u
                                                                                                                      local.get 15
                                                                                                                      i32.or
                                                                                                                      i32.store8
                                                                                                                      local.get 31
                                                                                                                      i64.const 4
                                                                                                                      i64.shr_u
                                                                                                                      local.tee 31
                                                                                                                      i64.const 0
                                                                                                                      i64.ne
                                                                                                                      br_if 0 (;@57;)
                                                                                                                    end
                                                                                                                    local.get 23
                                                                                                                    i32.const 8
                                                                                                                    i32.and
                                                                                                                    i32.eqz
                                                                                                                    br_if 47 (;@9;)
                                                                                                                    local.get 5
                                                                                                                    i64.load offset=56
                                                                                                                    i64.eqz
                                                                                                                    br_if 47 (;@9;)
                                                                                                                    local.get 25
                                                                                                                    i32.const 4
                                                                                                                    i32.shr_s
                                                                                                                    i32.const 2710
                                                                                                                    i32.add
                                                                                                                    local.set 32
                                                                                                                    i32.const 2
                                                                                                                    local.set 21
                                                                                                                    local.get 24
                                                                                                                    br_if 48 (;@8;)
                                                                                                                    br 49 (;@7;)
                                                                                                                  end
                                                                                                                  local.get 12
                                                                                                                  local.set 18
                                                                                                                  local.get 24
                                                                                                                  br_if 47 (;@8;)
                                                                                                                  br 48 (;@7;)
                                                                                                                end
                                                                                                                local.get 5
                                                                                                                i32.load offset=56
                                                                                                                local.tee 15
                                                                                                                i32.const 2720
                                                                                                                local.get 15
                                                                                                                select
                                                                                                                local.set 18
                                                                                                              end
                                                                                                              i32.const 0
                                                                                                              local.set 21
                                                                                                              local.get 18
                                                                                                              local.get 18
                                                                                                              i32.const 2147483647
                                                                                                              local.get 16
                                                                                                              local.get 16
                                                                                                              i32.const 0
                                                                                                              i32.lt_s
                                                                                                              select
                                                                                                              call $strnlen
                                                                                                              local.tee 19
                                                                                                              i32.add
                                                                                                              local.set 15
                                                                                                              i32.const 2710
                                                                                                              local.set 32
                                                                                                              local.get 16
                                                                                                              i32.const -1
                                                                                                              i32.le_s
                                                                                                              br_if 4 (;@49;)
                                                                                                              local.get 26
                                                                                                              local.set 23
                                                                                                              local.get 19
                                                                                                              local.set 16
                                                                                                              br 48 (;@5;)
                                                                                                            end
                                                                                                            i32.const 0
                                                                                                            local.set 21
                                                                                                            i32.const 2710
                                                                                                            local.set 32
                                                                                                            local.get 5
                                                                                                            i64.load offset=56
                                                                                                            local.tee 31
                                                                                                            i64.const 4294967296
                                                                                                            i64.lt_u
                                                                                                            br_if 40 (;@12;)
                                                                                                            br 41 (;@11;)
                                                                                                          end
                                                                                                          local.get 5
                                                                                                          i32.load offset=364
                                                                                                          local.set 21
                                                                                                        end
                                                                                                        i32.const 6
                                                                                                        local.get 16
                                                                                                        local.get 15
                                                                                                        select
                                                                                                        local.set 24
                                                                                                        local.get 5
                                                                                                        i32.const 368
                                                                                                        i32.add
                                                                                                        local.get 10
                                                                                                        local.get 21
                                                                                                        i32.const 0
                                                                                                        i32.lt_s
                                                                                                        select
                                                                                                        local.tee 32
                                                                                                        local.set 17
                                                                                                        loop  ;; label = @51
                                                                                                          block  ;; label = @52
                                                                                                            block  ;; label = @53
                                                                                                              local.get 27
                                                                                                              f64.const 0x1p+32 (;=4.29497e+09;)
                                                                                                              f64.lt
                                                                                                              local.get 27
                                                                                                              f64.const 0x0p+0 (;=0;)
                                                                                                              f64.ge
                                                                                                              i32.and
                                                                                                              br_if 0 (;@53;)
                                                                                                              i32.const 0
                                                                                                              local.set 15
                                                                                                              br 1 (;@52;)
                                                                                                            end
                                                                                                            local.get 27
                                                                                                            i32.trunc_f64_u
                                                                                                            local.set 15
                                                                                                          end
                                                                                                          local.get 17
                                                                                                          local.get 15
                                                                                                          i32.store
                                                                                                          local.get 17
                                                                                                          i32.const 4
                                                                                                          i32.add
                                                                                                          local.set 17
                                                                                                          local.get 27
                                                                                                          local.get 15
                                                                                                          f64.convert_i32_u
                                                                                                          f64.sub
                                                                                                          f64.const 0x1.dcd65p+29 (;=1e+09;)
                                                                                                          f64.mul
                                                                                                          local.tee 27
                                                                                                          f64.const 0x0p+0 (;=0;)
                                                                                                          f64.ne
                                                                                                          br_if 0 (;@51;)
                                                                                                        end
                                                                                                        block  ;; label = @51
                                                                                                          local.get 21
                                                                                                          i32.const 1
                                                                                                          i32.lt_s
                                                                                                          br_if 0 (;@51;)
                                                                                                          local.get 32
                                                                                                          local.set 19
                                                                                                          i32.const 0
                                                                                                          local.set 34
                                                                                                          br 34 (;@17;)
                                                                                                        end
                                                                                                        local.get 17
                                                                                                        local.set 35
                                                                                                        local.get 32
                                                                                                        local.set 19
                                                                                                        i32.const 0
                                                                                                        local.set 15
                                                                                                        br 34 (;@16;)
                                                                                                      end
                                                                                                      local.get 5
                                                                                                      i64.const 0
                                                                                                      local.get 31
                                                                                                      i64.sub
                                                                                                      local.tee 31
                                                                                                      i64.store offset=56
                                                                                                      i32.const 1
                                                                                                      local.set 21
                                                                                                      i32.const 2710
                                                                                                      local.set 32
                                                                                                      local.get 31
                                                                                                      i64.const 4294967296
                                                                                                      i64.ge_u
                                                                                                      br_if 38 (;@11;)
                                                                                                      br 37 (;@12;)
                                                                                                    end
                                                                                                    local.get 26
                                                                                                    local.set 23
                                                                                                    local.get 19
                                                                                                    local.set 16
                                                                                                    local.get 15
                                                                                                    i32.load8_u
                                                                                                    i32.eqz
                                                                                                    br_if 43 (;@5;)
                                                                                                    br 45 (;@3;)
                                                                                                  end
                                                                                                  local.get 17
                                                                                                  br_if 1 (;@46;)
                                                                                                end
                                                                                                local.get 5
                                                                                                i32.const 64
                                                                                                i32.add
                                                                                                local.get 22
                                                                                                local.get 0
                                                                                                call $__fwritex
                                                                                                drop
                                                                                              end
                                                                                              block  ;; label = @46
                                                                                                local.get 0
                                                                                                i32.load
                                                                                                local.tee 15
                                                                                                i32.const 32
                                                                                                i32.and
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 28
                                                                                                local.get 26
                                                                                                local.get 0
                                                                                                call $__fwritex
                                                                                                drop
                                                                                                local.get 0
                                                                                                i32.load
                                                                                                local.set 15
                                                                                              end
                                                                                              block  ;; label = @46
                                                                                                local.get 15
                                                                                                i32.const 32
                                                                                                i32.and
                                                                                                br_if 0 (;@46;)
                                                                                                i32.const 3387
                                                                                                i32.const 3391
                                                                                                local.get 25
                                                                                                i32.const 32
                                                                                                i32.and
                                                                                                i32.const 5
                                                                                                i32.shr_u
                                                                                                local.tee 15
                                                                                                select
                                                                                                i32.const 3379
                                                                                                i32.const 3383
                                                                                                local.get 15
                                                                                                select
                                                                                                local.get 27
                                                                                                local.get 27
                                                                                                f64.ne
                                                                                                select
                                                                                                i32.const 3
                                                                                                local.get 0
                                                                                                call $__fwritex
                                                                                                drop
                                                                                              end
                                                                                              block  ;; label = @46
                                                                                                local.get 23
                                                                                                i32.const 73728
                                                                                                i32.and
                                                                                                i32.const 8192
                                                                                                i32.ne
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 20
                                                                                                local.get 16
                                                                                                i32.le_s
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 5
                                                                                                i32.const 64
                                                                                                i32.add
                                                                                                i32.const 32
                                                                                                local.get 20
                                                                                                local.get 16
                                                                                                i32.sub
                                                                                                local.tee 22
                                                                                                i32.const 256
                                                                                                local.get 22
                                                                                                i32.const 256
                                                                                                i32.lt_u
                                                                                                local.tee 15
                                                                                                select
                                                                                                call $memset
                                                                                                drop
                                                                                                local.get 0
                                                                                                i32.load
                                                                                                local.tee 19
                                                                                                i32.const 32
                                                                                                i32.and
                                                                                                local.set 17
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    local.get 15
                                                                                                    br_if 0 (;@48;)
                                                                                                    local.get 17
                                                                                                    i32.eqz
                                                                                                    local.set 15
                                                                                                    local.get 22
                                                                                                    local.set 17
                                                                                                    loop  ;; label = @49
                                                                                                      block  ;; label = @50
                                                                                                        local.get 15
                                                                                                        i32.const 1
                                                                                                        i32.and
                                                                                                        i32.eqz
                                                                                                        br_if 0 (;@50;)
                                                                                                        local.get 5
                                                                                                        i32.const 64
                                                                                                        i32.add
                                                                                                        i32.const 256
                                                                                                        local.get 0
                                                                                                        call $__fwritex
                                                                                                        drop
                                                                                                        local.get 0
                                                                                                        i32.load
                                                                                                        local.set 19
                                                                                                      end
                                                                                                      local.get 19
                                                                                                      i32.const 32
                                                                                                      i32.and
                                                                                                      local.tee 18
                                                                                                      i32.eqz
                                                                                                      local.set 15
                                                                                                      local.get 17
                                                                                                      i32.const -256
                                                                                                      i32.add
                                                                                                      local.tee 17
                                                                                                      i32.const 255
                                                                                                      i32.gt_u
                                                                                                      br_if 0 (;@49;)
                                                                                                    end
                                                                                                    local.get 18
                                                                                                    br_if 2 (;@46;)
                                                                                                    local.get 22
                                                                                                    i32.const 255
                                                                                                    i32.and
                                                                                                    local.set 22
                                                                                                    br 1 (;@47;)
                                                                                                  end
                                                                                                  local.get 17
                                                                                                  br_if 1 (;@46;)
                                                                                                end
                                                                                                local.get 5
                                                                                                i32.const 64
                                                                                                i32.add
                                                                                                local.get 22
                                                                                                local.get 0
                                                                                                call $__fwritex
                                                                                                drop
                                                                                              end
                                                                                              local.get 20
                                                                                              local.get 16
                                                                                              local.get 20
                                                                                              local.get 16
                                                                                              i32.gt_s
                                                                                              select
                                                                                              local.set 15
                                                                                              br 30 (;@15;)
                                                                                            end
                                                                                            i32.const 1
                                                                                            local.set 21
                                                                                            i32.const 2711
                                                                                            local.set 32
                                                                                            local.get 31
                                                                                            i64.const 4294967296
                                                                                            i64.lt_u
                                                                                            br_if 32 (;@12;)
                                                                                            br 33 (;@11;)
                                                                                          end
                                                                                          local.get 27
                                                                                          local.get 29
                                                                                          f64.add
                                                                                          local.get 29
                                                                                          f64.sub
                                                                                          local.set 27
                                                                                        end
                                                                                        local.get 11
                                                                                        local.set 19
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            local.get 5
                                                                                            i32.load offset=364
                                                                                            local.tee 24
                                                                                            local.get 24
                                                                                            i32.const 31
                                                                                            i32.shr_s
                                                                                            local.tee 15
                                                                                            i32.add
                                                                                            local.get 15
                                                                                            i32.xor
                                                                                            local.tee 15
                                                                                            i32.eqz
                                                                                            br_if 0 (;@44;)
                                                                                            i32.const 0
                                                                                            local.set 17
                                                                                            loop  ;; label = @45
                                                                                              local.get 5
                                                                                              i32.const 324
                                                                                              i32.add
                                                                                              local.get 17
                                                                                              i32.add
                                                                                              i32.const 11
                                                                                              i32.add
                                                                                              local.get 15
                                                                                              local.get 15
                                                                                              i32.const 10
                                                                                              i32.div_u
                                                                                              local.tee 19
                                                                                              i32.const 10
                                                                                              i32.mul
                                                                                              i32.sub
                                                                                              i32.const 48
                                                                                              i32.or
                                                                                              i32.store8
                                                                                              local.get 17
                                                                                              i32.const -1
                                                                                              i32.add
                                                                                              local.set 17
                                                                                              local.get 15
                                                                                              i32.const 9
                                                                                              i32.gt_u
                                                                                              local.set 18
                                                                                              local.get 19
                                                                                              local.set 15
                                                                                              local.get 18
                                                                                              br_if 0 (;@45;)
                                                                                            end
                                                                                            local.get 5
                                                                                            i32.const 324
                                                                                            i32.add
                                                                                            local.get 17
                                                                                            i32.add
                                                                                            i32.const 12
                                                                                            i32.add
                                                                                            local.set 19
                                                                                            local.get 17
                                                                                            br_if 1 (;@43;)
                                                                                          end
                                                                                          local.get 19
                                                                                          i32.const -1
                                                                                          i32.add
                                                                                          local.tee 19
                                                                                          i32.const 48
                                                                                          i32.store8
                                                                                        end
                                                                                        local.get 26
                                                                                        i32.const 2
                                                                                        i32.or
                                                                                        local.set 21
                                                                                        local.get 19
                                                                                        i32.const -2
                                                                                        i32.add
                                                                                        local.tee 26
                                                                                        local.get 25
                                                                                        i32.const 15
                                                                                        i32.add
                                                                                        i32.store8
                                                                                        local.get 19
                                                                                        i32.const -1
                                                                                        i32.add
                                                                                        i32.const 45
                                                                                        i32.const 43
                                                                                        local.get 24
                                                                                        i32.const 0
                                                                                        i32.lt_s
                                                                                        select
                                                                                        i32.store8
                                                                                        local.get 23
                                                                                        i32.const 8
                                                                                        i32.and
                                                                                        local.set 19
                                                                                        local.get 5
                                                                                        i32.const 336
                                                                                        i32.add
                                                                                        local.set 17
                                                                                        loop  ;; label = @43
                                                                                          local.get 17
                                                                                          local.set 15
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              local.get 27
                                                                                              f64.abs
                                                                                              f64.const 0x1p+31 (;=2.14748e+09;)
                                                                                              f64.lt
                                                                                              br_if 0 (;@45;)
                                                                                              i32.const -2147483648
                                                                                              local.set 17
                                                                                              br 1 (;@44;)
                                                                                            end
                                                                                            local.get 27
                                                                                            i32.trunc_f64_s
                                                                                            local.set 17
                                                                                          end
                                                                                          local.get 15
                                                                                          local.get 17
                                                                                          i32.const 3344
                                                                                          i32.add
                                                                                          i32.load8_u
                                                                                          local.get 22
                                                                                          i32.or
                                                                                          i32.store8
                                                                                          local.get 27
                                                                                          local.get 17
                                                                                          f64.convert_i32_s
                                                                                          f64.sub
                                                                                          f64.const 0x1p+4 (;=16;)
                                                                                          f64.mul
                                                                                          local.set 27
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                local.get 15
                                                                                                i32.const 1
                                                                                                i32.add
                                                                                                local.tee 17
                                                                                                local.get 5
                                                                                                i32.const 336
                                                                                                i32.add
                                                                                                i32.sub
                                                                                                i32.const 1
                                                                                                i32.ne
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 19
                                                                                                br_if 1 (;@45;)
                                                                                                local.get 16
                                                                                                i32.const 0
                                                                                                i32.gt_s
                                                                                                br_if 1 (;@45;)
                                                                                                local.get 27
                                                                                                f64.const 0x0p+0 (;=0;)
                                                                                                f64.ne
                                                                                                br_if 1 (;@45;)
                                                                                              end
                                                                                              local.get 27
                                                                                              f64.const 0x0p+0 (;=0;)
                                                                                              f64.ne
                                                                                              br_if 2 (;@43;)
                                                                                              br 1 (;@44;)
                                                                                            end
                                                                                            local.get 15
                                                                                            i32.const 1
                                                                                            i32.add
                                                                                            i32.const 46
                                                                                            i32.store8
                                                                                            local.get 15
                                                                                            i32.const 2
                                                                                            i32.add
                                                                                            local.set 17
                                                                                            local.get 27
                                                                                            f64.const 0x0p+0 (;=0;)
                                                                                            f64.ne
                                                                                            br_if 1 (;@43;)
                                                                                          end
                                                                                        end
                                                                                        i32.const -1
                                                                                        local.set 15
                                                                                        i32.const 2147483645
                                                                                        local.get 21
                                                                                        i32.sub
                                                                                        local.get 11
                                                                                        local.get 26
                                                                                        i32.sub
                                                                                        local.tee 22
                                                                                        i32.sub
                                                                                        local.get 16
                                                                                        i32.lt_s
                                                                                        br_if 27 (;@15;)
                                                                                        local.get 22
                                                                                        local.get 21
                                                                                        i32.add
                                                                                        local.get 16
                                                                                        i32.const 2
                                                                                        i32.add
                                                                                        local.get 17
                                                                                        local.get 5
                                                                                        i32.const 336
                                                                                        i32.add
                                                                                        i32.sub
                                                                                        local.tee 25
                                                                                        local.get 8
                                                                                        local.get 17
                                                                                        i32.add
                                                                                        local.get 16
                                                                                        i32.lt_s
                                                                                        select
                                                                                        local.get 25
                                                                                        local.get 16
                                                                                        select
                                                                                        local.tee 37
                                                                                        i32.add
                                                                                        local.set 16
                                                                                        local.get 23
                                                                                        i32.const 73728
                                                                                        i32.and
                                                                                        local.tee 24
                                                                                        br_if 5 (;@37;)
                                                                                        local.get 20
                                                                                        local.get 16
                                                                                        i32.le_s
                                                                                        br_if 5 (;@37;)
                                                                                        local.get 5
                                                                                        i32.const 64
                                                                                        i32.add
                                                                                        i32.const 32
                                                                                        local.get 20
                                                                                        local.get 16
                                                                                        i32.sub
                                                                                        local.tee 23
                                                                                        i32.const 256
                                                                                        local.get 23
                                                                                        i32.const 256
                                                                                        i32.lt_u
                                                                                        local.tee 15
                                                                                        select
                                                                                        call $memset
                                                                                        drop
                                                                                        local.get 0
                                                                                        i32.load
                                                                                        local.tee 19
                                                                                        i32.const 32
                                                                                        i32.and
                                                                                        local.set 17
                                                                                        local.get 15
                                                                                        br_if 3 (;@39;)
                                                                                        local.get 17
                                                                                        i32.eqz
                                                                                        local.set 15
                                                                                        local.get 23
                                                                                        local.set 17
                                                                                        loop  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            local.get 15
                                                                                            i32.const 1
                                                                                            i32.and
                                                                                            i32.eqz
                                                                                            br_if 0 (;@44;)
                                                                                            local.get 5
                                                                                            i32.const 64
                                                                                            i32.add
                                                                                            i32.const 256
                                                                                            local.get 0
                                                                                            call $__fwritex
                                                                                            drop
                                                                                            local.get 0
                                                                                            i32.load
                                                                                            local.set 19
                                                                                          end
                                                                                          local.get 19
                                                                                          i32.const 32
                                                                                          i32.and
                                                                                          local.tee 18
                                                                                          i32.eqz
                                                                                          local.set 15
                                                                                          local.get 17
                                                                                          i32.const -256
                                                                                          i32.add
                                                                                          local.tee 17
                                                                                          i32.const 255
                                                                                          i32.gt_u
                                                                                          br_if 0 (;@43;)
                                                                                        end
                                                                                        local.get 18
                                                                                        br_if 5 (;@37;)
                                                                                        local.get 23
                                                                                        i32.const 255
                                                                                        i32.and
                                                                                        local.set 23
                                                                                        br 4 (;@38;)
                                                                                      end
                                                                                      local.get 22
                                                                                      br_if 39 (;@2;)
                                                                                    end
                                                                                    local.get 15
                                                                                    i32.const 0
                                                                                    i32.lt_s
                                                                                    br_if 37 (;@3;)
                                                                                    local.get 23
                                                                                    i32.const 73728
                                                                                    i32.and
                                                                                    local.tee 23
                                                                                    br_if 27 (;@13;)
                                                                                    br 26 (;@14;)
                                                                                  end
                                                                                  i32.const 0
                                                                                  local.set 15
                                                                                  local.get 23
                                                                                  i32.const 73728
                                                                                  i32.and
                                                                                  local.tee 23
                                                                                  i32.eqz
                                                                                  br_if 25 (;@14;)
                                                                                  br 26 (;@13;)
                                                                                end
                                                                                local.get 17
                                                                                br_if 1 (;@37;)
                                                                              end
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              local.get 23
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 0
                                                                              i32.load8_u
                                                                              i32.const 32
                                                                              i32.and
                                                                              br_if 0 (;@37;)
                                                                              local.get 28
                                                                              local.get 21
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 24
                                                                              i32.const 65536
                                                                              i32.ne
                                                                              br_if 0 (;@37;)
                                                                              local.get 20
                                                                              local.get 16
                                                                              i32.le_s
                                                                              br_if 0 (;@37;)
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              i32.const 48
                                                                              local.get 20
                                                                              local.get 16
                                                                              i32.sub
                                                                              local.tee 23
                                                                              i32.const 256
                                                                              local.get 23
                                                                              i32.const 256
                                                                              i32.lt_u
                                                                              local.tee 15
                                                                              select
                                                                              call $memset
                                                                              drop
                                                                              local.get 0
                                                                              i32.load
                                                                              local.tee 19
                                                                              i32.const 32
                                                                              i32.and
                                                                              local.set 17
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  local.get 15
                                                                                  br_if 0 (;@39;)
                                                                                  local.get 17
                                                                                  i32.eqz
                                                                                  local.set 15
                                                                                  local.get 23
                                                                                  local.set 17
                                                                                  loop  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 15
                                                                                      i32.const 1
                                                                                      i32.and
                                                                                      i32.eqz
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 5
                                                                                      i32.const 64
                                                                                      i32.add
                                                                                      i32.const 256
                                                                                      local.get 0
                                                                                      call $__fwritex
                                                                                      drop
                                                                                      local.get 0
                                                                                      i32.load
                                                                                      local.set 19
                                                                                    end
                                                                                    local.get 19
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    local.tee 18
                                                                                    i32.eqz
                                                                                    local.set 15
                                                                                    local.get 17
                                                                                    i32.const -256
                                                                                    i32.add
                                                                                    local.tee 17
                                                                                    i32.const 255
                                                                                    i32.gt_u
                                                                                    br_if 0 (;@40;)
                                                                                  end
                                                                                  local.get 18
                                                                                  br_if 2 (;@37;)
                                                                                  local.get 23
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  local.set 23
                                                                                  br 1 (;@38;)
                                                                                end
                                                                                local.get 17
                                                                                br_if 1 (;@37;)
                                                                              end
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              local.get 23
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 0
                                                                              i32.load8_u
                                                                              i32.const 32
                                                                              i32.and
                                                                              br_if 0 (;@37;)
                                                                              local.get 5
                                                                              i32.const 336
                                                                              i32.add
                                                                              local.get 25
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 37
                                                                              local.get 25
                                                                              i32.sub
                                                                              local.tee 23
                                                                              i32.const 1
                                                                              i32.lt_s
                                                                              br_if 0 (;@37;)
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              i32.const 48
                                                                              local.get 23
                                                                              i32.const 256
                                                                              local.get 23
                                                                              i32.const 256
                                                                              i32.lt_u
                                                                              local.tee 15
                                                                              select
                                                                              call $memset
                                                                              drop
                                                                              local.get 0
                                                                              i32.load
                                                                              local.tee 19
                                                                              i32.const 32
                                                                              i32.and
                                                                              local.set 17
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  local.get 15
                                                                                  br_if 0 (;@39;)
                                                                                  local.get 17
                                                                                  i32.eqz
                                                                                  local.set 15
                                                                                  local.get 23
                                                                                  local.set 17
                                                                                  loop  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 15
                                                                                      i32.const 1
                                                                                      i32.and
                                                                                      i32.eqz
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 5
                                                                                      i32.const 64
                                                                                      i32.add
                                                                                      i32.const 256
                                                                                      local.get 0
                                                                                      call $__fwritex
                                                                                      drop
                                                                                      local.get 0
                                                                                      i32.load
                                                                                      local.set 19
                                                                                    end
                                                                                    local.get 19
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    local.tee 18
                                                                                    i32.eqz
                                                                                    local.set 15
                                                                                    local.get 17
                                                                                    i32.const -256
                                                                                    i32.add
                                                                                    local.tee 17
                                                                                    i32.const 255
                                                                                    i32.gt_u
                                                                                    br_if 0 (;@40;)
                                                                                  end
                                                                                  local.get 18
                                                                                  br_if 2 (;@37;)
                                                                                  local.get 23
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  local.set 23
                                                                                  br 1 (;@38;)
                                                                                end
                                                                                local.get 17
                                                                                br_if 1 (;@37;)
                                                                              end
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              local.get 23
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 0
                                                                              i32.load8_u
                                                                              i32.const 32
                                                                              i32.and
                                                                              br_if 0 (;@37;)
                                                                              local.get 26
                                                                              local.get 22
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            block  ;; label = @37
                                                                              local.get 24
                                                                              i32.const 8192
                                                                              i32.ne
                                                                              br_if 0 (;@37;)
                                                                              local.get 20
                                                                              local.get 16
                                                                              i32.le_s
                                                                              br_if 0 (;@37;)
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              i32.const 32
                                                                              local.get 20
                                                                              local.get 16
                                                                              i32.sub
                                                                              local.tee 22
                                                                              i32.const 256
                                                                              local.get 22
                                                                              i32.const 256
                                                                              i32.lt_u
                                                                              local.tee 15
                                                                              select
                                                                              call $memset
                                                                              drop
                                                                              local.get 0
                                                                              i32.load
                                                                              local.tee 19
                                                                              i32.const 32
                                                                              i32.and
                                                                              local.set 17
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  local.get 15
                                                                                  br_if 0 (;@39;)
                                                                                  local.get 17
                                                                                  i32.eqz
                                                                                  local.set 15
                                                                                  local.get 22
                                                                                  local.set 17
                                                                                  loop  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 15
                                                                                      i32.const 1
                                                                                      i32.and
                                                                                      i32.eqz
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 5
                                                                                      i32.const 64
                                                                                      i32.add
                                                                                      i32.const 256
                                                                                      local.get 0
                                                                                      call $__fwritex
                                                                                      drop
                                                                                      local.get 0
                                                                                      i32.load
                                                                                      local.set 19
                                                                                    end
                                                                                    local.get 19
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    local.tee 18
                                                                                    i32.eqz
                                                                                    local.set 15
                                                                                    local.get 17
                                                                                    i32.const -256
                                                                                    i32.add
                                                                                    local.tee 17
                                                                                    i32.const 255
                                                                                    i32.gt_u
                                                                                    br_if 0 (;@40;)
                                                                                  end
                                                                                  local.get 18
                                                                                  br_if 2 (;@37;)
                                                                                  local.get 22
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  local.set 22
                                                                                  br 1 (;@38;)
                                                                                end
                                                                                local.get 17
                                                                                br_if 1 (;@37;)
                                                                              end
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              local.get 22
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                            end
                                                                            local.get 20
                                                                            local.get 16
                                                                            local.get 20
                                                                            local.get 16
                                                                            i32.gt_s
                                                                            select
                                                                            local.set 15
                                                                            br 21 (;@15;)
                                                                          end
                                                                          local.get 5
                                                                          i32.load offset=56
                                                                          local.get 14
                                                                          i32.store
                                                                          br 31 (;@4;)
                                                                        end
                                                                        local.get 5
                                                                        i32.load offset=56
                                                                        local.get 14
                                                                        i64.extend_i32_s
                                                                        i64.store
                                                                        br 30 (;@4;)
                                                                      end
                                                                      local.get 5
                                                                      i32.load offset=56
                                                                      local.get 14
                                                                      i32.store16
                                                                      br 29 (;@4;)
                                                                    end
                                                                    local.get 5
                                                                    i32.load offset=56
                                                                    local.get 14
                                                                    i32.store8
                                                                    br 28 (;@4;)
                                                                  end
                                                                  local.get 5
                                                                  i32.load offset=56
                                                                  local.get 14
                                                                  i32.store
                                                                  br 27 (;@4;)
                                                                end
                                                                local.get 5
                                                                i32.load offset=56
                                                                local.get 14
                                                                i64.extend_i32_s
                                                                i64.store
                                                                br 26 (;@4;)
                                                              end
                                                              local.get 0
                                                              br_if 28 (;@1;)
                                                              local.get 13
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              i32.const 1
                                                              local.set 15
                                                              local.get 4
                                                              i32.load offset=4
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 9 (;@20;)
                                                              local.get 3
                                                              i32.const 8
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=8
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 1 (;@28;)
                                                              local.get 3
                                                              i32.const 16
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=12
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 2 (;@27;)
                                                              local.get 3
                                                              i32.const 24
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=16
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 3 (;@26;)
                                                              local.get 3
                                                              i32.const 32
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=20
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 4 (;@25;)
                                                              local.get 3
                                                              i32.const 40
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=24
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 5 (;@24;)
                                                              local.get 3
                                                              i32.const 48
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=28
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 6 (;@23;)
                                                              local.get 3
                                                              i32.const 56
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=32
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 7 (;@22;)
                                                              local.get 3
                                                              i32.const 64
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              local.get 4
                                                              i32.load offset=36
                                                              local.tee 1
                                                              i32.eqz
                                                              br_if 8 (;@21;)
                                                              local.get 3
                                                              i32.const 72
                                                              i32.add
                                                              local.get 1
                                                              local.get 2
                                                              call $pop_arg
                                                              br 10 (;@19;)
                                                            end
                                                            i32.const 0
                                                            local.set 14
                                                            br 27 (;@1;)
                                                          end
                                                          i32.const 2
                                                          local.set 15
                                                          br 7 (;@20;)
                                                        end
                                                        i32.const 3
                                                        local.set 15
                                                        br 6 (;@20;)
                                                      end
                                                      i32.const 4
                                                      local.set 15
                                                      br 5 (;@20;)
                                                    end
                                                    i32.const 5
                                                    local.set 15
                                                    br 4 (;@20;)
                                                  end
                                                  i32.const 6
                                                  local.set 15
                                                  br 3 (;@20;)
                                                end
                                                i32.const 7
                                                local.set 15
                                                br 2 (;@20;)
                                              end
                                              i32.const 8
                                              local.set 15
                                              br 1 (;@20;)
                                            end
                                            i32.const 9
                                            local.set 15
                                          end
                                          local.get 4
                                          local.get 15
                                          i32.const 2
                                          i32.shl
                                          i32.add
                                          local.set 1
                                          loop  ;; label = @20
                                            local.get 1
                                            i32.load
                                            br_if 2 (;@18;)
                                            local.get 1
                                            i32.const 4
                                            i32.add
                                            local.set 1
                                            local.get 15
                                            i32.const 1
                                            i32.add
                                            local.tee 15
                                            i32.const 9
                                            i32.le_u
                                            br_if 0 (;@20;)
                                          end
                                        end
                                        i32.const 1
                                        local.set 14
                                        br 17 (;@1;)
                                      end
                                      i32.const 0
                                      i32.const 28
                                      i32.store offset=3904
                                      br 15 (;@2;)
                                    end
                                    i32.const 1
                                    local.set 15
                                  end
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      block  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 15
                                                                                                  br_table 0 (;@47;) 1 (;@46;) 1 (;@46;)
                                                                                                end
                                                                                                local.get 21
                                                                                                i32.const -1
                                                                                                i32.gt_s
                                                                                                br_if 1 (;@45;)
                                                                                                local.get 24
                                                                                                i32.const 25
                                                                                                i32.add
                                                                                                i32.const 9
                                                                                                i32.div_u
                                                                                                i32.const 1
                                                                                                i32.add
                                                                                                local.set 36
                                                                                                i32.const 1
                                                                                                local.set 34
                                                                                                br 22 (;@24;)
                                                                                              end
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 34
                                                                                                  br_table 0 (;@47;) 1 (;@46;) 3 (;@44;) 4 (;@43;) 7 (;@40;) 7 (;@40;)
                                                                                                end
                                                                                                local.get 21
                                                                                                i32.const 29
                                                                                                local.get 21
                                                                                                i32.const 29
                                                                                                i32.lt_s
                                                                                                select
                                                                                                local.set 18
                                                                                                block  ;; label = @47
                                                                                                  local.get 17
                                                                                                  i32.const -4
                                                                                                  i32.add
                                                                                                  local.tee 15
                                                                                                  local.get 19
                                                                                                  i32.lt_u
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 18
                                                                                                  i64.extend_i32_u
                                                                                                  local.set 33
                                                                                                  i64.const 0
                                                                                                  local.set 31
                                                                                                  loop  ;; label = @48
                                                                                                    local.get 15
                                                                                                    local.get 15
                                                                                                    i64.load32_u
                                                                                                    local.get 33
                                                                                                    i64.shl
                                                                                                    local.get 31
                                                                                                    i64.const 4294967295
                                                                                                    i64.and
                                                                                                    i64.add
                                                                                                    local.tee 31
                                                                                                    local.get 31
                                                                                                    i64.const 1000000000
                                                                                                    i64.div_u
                                                                                                    local.tee 31
                                                                                                    i64.const 1000000000
                                                                                                    i64.mul
                                                                                                    i64.sub
                                                                                                    i64.store32
                                                                                                    local.get 15
                                                                                                    i32.const -4
                                                                                                    i32.add
                                                                                                    local.tee 15
                                                                                                    local.get 19
                                                                                                    i32.ge_u
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                  local.get 31
                                                                                                  i32.wrap_i64
                                                                                                  local.tee 15
                                                                                                  i32.eqz
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 19
                                                                                                  i32.const -4
                                                                                                  i32.add
                                                                                                  local.tee 19
                                                                                                  local.get 15
                                                                                                  i32.store
                                                                                                end
                                                                                                block  ;; label = @47
                                                                                                  loop  ;; label = @48
                                                                                                    local.get 17
                                                                                                    local.tee 35
                                                                                                    local.get 19
                                                                                                    i32.le_u
                                                                                                    br_if 1 (;@47;)
                                                                                                    local.get 35
                                                                                                    i32.const -4
                                                                                                    i32.add
                                                                                                    local.tee 17
                                                                                                    i32.load
                                                                                                    i32.eqz
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                end
                                                                                                local.get 5
                                                                                                local.get 5
                                                                                                i32.load offset=364
                                                                                                local.get 18
                                                                                                i32.sub
                                                                                                local.tee 21
                                                                                                i32.store offset=364
                                                                                                local.get 35
                                                                                                local.set 17
                                                                                                local.get 21
                                                                                                i32.const 0
                                                                                                i32.gt_s
                                                                                                br_if 15 (;@31;)
                                                                                                br 20 (;@26;)
                                                                                              end
                                                                                              i32.const 0
                                                                                              local.get 21
                                                                                              i32.sub
                                                                                              local.tee 15
                                                                                              i32.const 9
                                                                                              local.get 15
                                                                                              i32.const 9
                                                                                              i32.lt_s
                                                                                              select
                                                                                              local.set 22
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 19
                                                                                                  local.get 35
                                                                                                  i32.ge_u
                                                                                                  br_if 0 (;@47;)
                                                                                                  i32.const 1000000000
                                                                                                  local.get 22
                                                                                                  i32.shr_u
                                                                                                  local.set 21
                                                                                                  i32.const -1
                                                                                                  local.get 22
                                                                                                  i32.shl
                                                                                                  i32.const -1
                                                                                                  i32.xor
                                                                                                  local.set 37
                                                                                                  i32.const 0
                                                                                                  local.set 18
                                                                                                  local.get 19
                                                                                                  local.set 15
                                                                                                  loop  ;; label = @48
                                                                                                    local.get 15
                                                                                                    local.get 15
                                                                                                    i32.load
                                                                                                    local.tee 16
                                                                                                    local.get 22
                                                                                                    i32.shr_u
                                                                                                    local.get 18
                                                                                                    i32.add
                                                                                                    i32.store
                                                                                                    local.get 16
                                                                                                    local.get 37
                                                                                                    i32.and
                                                                                                    local.get 21
                                                                                                    i32.mul
                                                                                                    local.set 18
                                                                                                    local.get 15
                                                                                                    i32.const 4
                                                                                                    i32.add
                                                                                                    local.tee 15
                                                                                                    local.get 35
                                                                                                    i32.lt_u
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                  local.get 19
                                                                                                  local.get 19
                                                                                                  i32.const 4
                                                                                                  i32.add
                                                                                                  local.get 19
                                                                                                  i32.load
                                                                                                  select
                                                                                                  local.set 19
                                                                                                  local.get 18
                                                                                                  i32.eqz
                                                                                                  br_if 1 (;@46;)
                                                                                                  local.get 35
                                                                                                  local.get 18
                                                                                                  i32.store
                                                                                                  local.get 35
                                                                                                  i32.const 4
                                                                                                  i32.add
                                                                                                  local.set 35
                                                                                                  br 1 (;@46;)
                                                                                                end
                                                                                                local.get 19
                                                                                                local.get 19
                                                                                                i32.const 4
                                                                                                i32.add
                                                                                                local.get 19
                                                                                                i32.load
                                                                                                select
                                                                                                local.set 19
                                                                                              end
                                                                                              local.get 5
                                                                                              local.get 5
                                                                                              i32.load offset=364
                                                                                              local.get 22
                                                                                              i32.add
                                                                                              local.tee 21
                                                                                              i32.store offset=364
                                                                                              local.get 32
                                                                                              local.get 19
                                                                                              local.get 30
                                                                                              i32.const 102
                                                                                              i32.eq
                                                                                              select
                                                                                              local.tee 15
                                                                                              local.get 36
                                                                                              i32.const 2
                                                                                              i32.shl
                                                                                              i32.add
                                                                                              local.get 35
                                                                                              local.get 35
                                                                                              local.get 15
                                                                                              i32.sub
                                                                                              i32.const 2
                                                                                              i32.shr_s
                                                                                              local.get 36
                                                                                              i32.gt_s
                                                                                              select
                                                                                              local.set 35
                                                                                              local.get 21
                                                                                              i32.const 0
                                                                                              i32.lt_s
                                                                                              br_if 15 (;@30;)
                                                                                            end
                                                                                            i32.const 0
                                                                                            local.set 18
                                                                                            block  ;; label = @45
                                                                                              local.get 19
                                                                                              local.get 35
                                                                                              i32.ge_u
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 32
                                                                                              local.get 19
                                                                                              i32.sub
                                                                                              i32.const 2
                                                                                              i32.shr_s
                                                                                              i32.const 9
                                                                                              i32.mul
                                                                                              local.set 18
                                                                                              local.get 19
                                                                                              i32.load
                                                                                              local.tee 16
                                                                                              i32.const 10
                                                                                              i32.lt_u
                                                                                              br_if 0 (;@45;)
                                                                                              i32.const 10
                                                                                              local.set 15
                                                                                              loop  ;; label = @46
                                                                                                local.get 18
                                                                                                i32.const 1
                                                                                                i32.add
                                                                                                local.set 18
                                                                                                local.get 16
                                                                                                local.get 15
                                                                                                i32.const 10
                                                                                                i32.mul
                                                                                                local.tee 15
                                                                                                i32.ge_u
                                                                                                br_if 0 (;@46;)
                                                                                              end
                                                                                            end
                                                                                            block  ;; label = @45
                                                                                              local.get 24
                                                                                              i32.const 0
                                                                                              local.get 18
                                                                                              local.get 30
                                                                                              i32.const 102
                                                                                              i32.eq
                                                                                              select
                                                                                              local.tee 16
                                                                                              i32.sub
                                                                                              local.get 24
                                                                                              i32.const 0
                                                                                              i32.ne
                                                                                              local.get 30
                                                                                              i32.const 103
                                                                                              i32.eq
                                                                                              local.tee 38
                                                                                              i32.and
                                                                                              local.tee 39
                                                                                              i32.sub
                                                                                              local.tee 15
                                                                                              local.get 35
                                                                                              local.get 32
                                                                                              i32.sub
                                                                                              i32.const 2
                                                                                              i32.shr_s
                                                                                              i32.const 9
                                                                                              i32.mul
                                                                                              i32.const -9
                                                                                              i32.add
                                                                                              i32.ge_s
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 32
                                                                                              local.get 15
                                                                                              i32.const 9216
                                                                                              i32.add
                                                                                              local.tee 40
                                                                                              i32.const 9
                                                                                              i32.div_s
                                                                                              local.tee 37
                                                                                              i32.const 2
                                                                                              i32.shl
                                                                                              i32.add
                                                                                              local.tee 41
                                                                                              i32.const -4092
                                                                                              i32.add
                                                                                              local.set 22
                                                                                              i32.const 10
                                                                                              local.set 15
                                                                                              block  ;; label = @46
                                                                                                local.get 40
                                                                                                local.get 37
                                                                                                i32.const 9
                                                                                                i32.mul
                                                                                                local.tee 37
                                                                                                i32.sub
                                                                                                i32.const 1
                                                                                                i32.add
                                                                                                i32.const 8
                                                                                                i32.gt_s
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 16
                                                                                                local.get 37
                                                                                                i32.add
                                                                                                i32.const -9208
                                                                                                i32.add
                                                                                                local.get 24
                                                                                                i32.sub
                                                                                                i32.const 0
                                                                                                local.get 39
                                                                                                i32.sub
                                                                                                i32.sub
                                                                                                local.set 16
                                                                                                i32.const 10
                                                                                                local.set 15
                                                                                                loop  ;; label = @47
                                                                                                  local.get 15
                                                                                                  i32.const 10
                                                                                                  i32.mul
                                                                                                  local.set 15
                                                                                                  local.get 16
                                                                                                  i32.const -1
                                                                                                  i32.add
                                                                                                  local.tee 16
                                                                                                  br_if 0 (;@47;)
                                                                                                end
                                                                                              end
                                                                                              local.get 22
                                                                                              i32.load
                                                                                              local.tee 39
                                                                                              local.get 39
                                                                                              local.get 15
                                                                                              i32.div_u
                                                                                              local.tee 40
                                                                                              local.get 15
                                                                                              i32.mul
                                                                                              i32.sub
                                                                                              local.set 16
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 22
                                                                                                  i32.const 4
                                                                                                  i32.add
                                                                                                  local.tee 37
                                                                                                  local.get 35
                                                                                                  i32.ne
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 16
                                                                                                  i32.eqz
                                                                                                  br_if 1 (;@46;)
                                                                                                end
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    local.get 40
                                                                                                    i32.const 1
                                                                                                    i32.and
                                                                                                    br_if 0 (;@48;)
                                                                                                    f64.const 0x1p+53 (;=9.0072e+15;)
                                                                                                    local.set 27
                                                                                                    local.get 22
                                                                                                    local.get 19
                                                                                                    i32.le_u
                                                                                                    br_if 1 (;@47;)
                                                                                                    local.get 15
                                                                                                    i32.const 1000000000
                                                                                                    i32.ne
                                                                                                    br_if 1 (;@47;)
                                                                                                    local.get 22
                                                                                                    i32.const -4
                                                                                                    i32.add
                                                                                                    i32.load8_u
                                                                                                    i32.const 1
                                                                                                    i32.and
                                                                                                    i32.eqz
                                                                                                    br_if 1 (;@47;)
                                                                                                  end
                                                                                                  f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
                                                                                                  local.set 27
                                                                                                end
                                                                                                f64.const 0x1p-1 (;=0.5;)
                                                                                                local.set 29
                                                                                                block  ;; label = @47
                                                                                                  local.get 16
                                                                                                  local.get 15
                                                                                                  i32.const 1
                                                                                                  i32.shr_u
                                                                                                  local.tee 40
                                                                                                  i32.lt_u
                                                                                                  br_if 0 (;@47;)
                                                                                                  f64.const 0x1p+0 (;=1;)
                                                                                                  f64.const 0x1.8p+0 (;=1.5;)
                                                                                                  local.get 16
                                                                                                  local.get 40
                                                                                                  i32.eq
                                                                                                  select
                                                                                                  f64.const 0x1.8p+0 (;=1.5;)
                                                                                                  local.get 37
                                                                                                  local.get 35
                                                                                                  i32.eq
                                                                                                  select
                                                                                                  local.set 29
                                                                                                end
                                                                                                block  ;; label = @47
                                                                                                  local.get 26
                                                                                                  i32.eqz
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 28
                                                                                                  i32.load8_u
                                                                                                  i32.const 45
                                                                                                  i32.ne
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 29
                                                                                                  f64.neg
                                                                                                  local.set 29
                                                                                                  local.get 27
                                                                                                  f64.neg
                                                                                                  local.set 27
                                                                                                end
                                                                                                local.get 22
                                                                                                local.get 39
                                                                                                local.get 16
                                                                                                i32.sub
                                                                                                local.tee 16
                                                                                                i32.store
                                                                                                local.get 27
                                                                                                local.get 29
                                                                                                f64.add
                                                                                                local.get 27
                                                                                                f64.eq
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 22
                                                                                                local.get 16
                                                                                                local.get 15
                                                                                                i32.add
                                                                                                local.tee 15
                                                                                                i32.store
                                                                                                block  ;; label = @47
                                                                                                  local.get 15
                                                                                                  i32.const 1000000000
                                                                                                  i32.lt_u
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 41
                                                                                                  i32.const -4096
                                                                                                  i32.add
                                                                                                  local.set 15
                                                                                                  loop  ;; label = @48
                                                                                                    local.get 15
                                                                                                    i32.const 4
                                                                                                    i32.add
                                                                                                    i32.const 0
                                                                                                    i32.store
                                                                                                    block  ;; label = @49
                                                                                                      local.get 15
                                                                                                      local.get 19
                                                                                                      i32.ge_u
                                                                                                      br_if 0 (;@49;)
                                                                                                      local.get 19
                                                                                                      i32.const -4
                                                                                                      i32.add
                                                                                                      local.tee 19
                                                                                                      i32.const 0
                                                                                                      i32.store
                                                                                                    end
                                                                                                    local.get 15
                                                                                                    local.get 15
                                                                                                    i32.load
                                                                                                    i32.const 1
                                                                                                    i32.add
                                                                                                    local.tee 18
                                                                                                    i32.store
                                                                                                    local.get 15
                                                                                                    i32.const -4
                                                                                                    i32.add
                                                                                                    local.set 15
                                                                                                    local.get 18
                                                                                                    i32.const 999999999
                                                                                                    i32.gt_u
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                  local.get 15
                                                                                                  i32.const 4
                                                                                                  i32.add
                                                                                                  local.set 22
                                                                                                end
                                                                                                local.get 32
                                                                                                local.get 19
                                                                                                i32.sub
                                                                                                i32.const 2
                                                                                                i32.shr_s
                                                                                                i32.const 9
                                                                                                i32.mul
                                                                                                local.set 18
                                                                                                local.get 19
                                                                                                i32.load
                                                                                                local.tee 16
                                                                                                i32.const 10
                                                                                                i32.lt_u
                                                                                                br_if 0 (;@46;)
                                                                                                i32.const 10
                                                                                                local.set 15
                                                                                                loop  ;; label = @47
                                                                                                  local.get 18
                                                                                                  i32.const 1
                                                                                                  i32.add
                                                                                                  local.set 18
                                                                                                  local.get 16
                                                                                                  local.get 15
                                                                                                  i32.const 10
                                                                                                  i32.mul
                                                                                                  local.tee 15
                                                                                                  i32.ge_u
                                                                                                  br_if 0 (;@47;)
                                                                                                end
                                                                                              end
                                                                                              local.get 22
                                                                                              i32.const 4
                                                                                              i32.add
                                                                                              local.tee 15
                                                                                              local.get 35
                                                                                              local.get 35
                                                                                              local.get 15
                                                                                              i32.gt_u
                                                                                              select
                                                                                              local.set 35
                                                                                            end
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    loop  ;; label = @49
                                                                                                      local.get 35
                                                                                                      local.tee 39
                                                                                                      local.get 19
                                                                                                      i32.le_u
                                                                                                      br_if 1 (;@48;)
                                                                                                      local.get 39
                                                                                                      i32.const -4
                                                                                                      i32.add
                                                                                                      local.tee 35
                                                                                                      i32.load
                                                                                                      i32.eqz
                                                                                                      br_if 0 (;@49;)
                                                                                                    end
                                                                                                    i32.const 1
                                                                                                    local.set 37
                                                                                                    local.get 38
                                                                                                    br_if 2 (;@46;)
                                                                                                    br 1 (;@47;)
                                                                                                  end
                                                                                                  i32.const 0
                                                                                                  local.set 37
                                                                                                  local.get 38
                                                                                                  br_if 1 (;@46;)
                                                                                                end
                                                                                                local.get 23
                                                                                                i32.const 8
                                                                                                i32.and
                                                                                                local.set 38
                                                                                                br 1 (;@45;)
                                                                                              end
                                                                                              local.get 18
                                                                                              i32.const -1
                                                                                              i32.xor
                                                                                              i32.const -1
                                                                                              local.get 24
                                                                                              i32.const 1
                                                                                              local.get 24
                                                                                              select
                                                                                              local.tee 15
                                                                                              local.get 18
                                                                                              i32.gt_s
                                                                                              local.get 18
                                                                                              i32.const -5
                                                                                              i32.gt_s
                                                                                              i32.and
                                                                                              local.tee 16
                                                                                              select
                                                                                              local.get 15
                                                                                              i32.add
                                                                                              local.set 24
                                                                                              i32.const -1
                                                                                              i32.const -2
                                                                                              local.get 16
                                                                                              select
                                                                                              local.get 25
                                                                                              i32.add
                                                                                              local.set 25
                                                                                              local.get 23
                                                                                              i32.const 8
                                                                                              i32.and
                                                                                              local.tee 38
                                                                                              br_if 0 (;@45;)
                                                                                              i32.const 9
                                                                                              local.set 15
                                                                                              block  ;; label = @46
                                                                                                local.get 37
                                                                                                i32.eqz
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 39
                                                                                                i32.const -4
                                                                                                i32.add
                                                                                                i32.load
                                                                                                local.tee 22
                                                                                                i32.eqz
                                                                                                br_if 0 (;@46;)
                                                                                                i32.const 0
                                                                                                local.set 15
                                                                                                local.get 22
                                                                                                i32.const 10
                                                                                                i32.rem_u
                                                                                                br_if 0 (;@46;)
                                                                                                i32.const 10
                                                                                                local.set 16
                                                                                                i32.const 0
                                                                                                local.set 15
                                                                                                loop  ;; label = @47
                                                                                                  local.get 15
                                                                                                  i32.const 1
                                                                                                  i32.add
                                                                                                  local.set 15
                                                                                                  local.get 22
                                                                                                  local.get 16
                                                                                                  i32.const 10
                                                                                                  i32.mul
                                                                                                  local.tee 16
                                                                                                  i32.rem_u
                                                                                                  i32.eqz
                                                                                                  br_if 0 (;@47;)
                                                                                                end
                                                                                              end
                                                                                              local.get 39
                                                                                              local.get 32
                                                                                              i32.sub
                                                                                              i32.const 2
                                                                                              i32.shr_s
                                                                                              i32.const 9
                                                                                              i32.mul
                                                                                              i32.const -9
                                                                                              i32.add
                                                                                              local.set 16
                                                                                              block  ;; label = @46
                                                                                                local.get 25
                                                                                                i32.const 32
                                                                                                i32.or
                                                                                                i32.const 102
                                                                                                i32.ne
                                                                                                br_if 0 (;@46;)
                                                                                                i32.const 0
                                                                                                local.set 38
                                                                                                local.get 24
                                                                                                local.get 16
                                                                                                local.get 15
                                                                                                i32.sub
                                                                                                local.tee 15
                                                                                                i32.const 0
                                                                                                local.get 15
                                                                                                i32.const 0
                                                                                                i32.gt_s
                                                                                                select
                                                                                                local.tee 15
                                                                                                local.get 24
                                                                                                local.get 15
                                                                                                i32.lt_s
                                                                                                select
                                                                                                local.set 24
                                                                                                br 1 (;@45;)
                                                                                              end
                                                                                              i32.const 0
                                                                                              local.set 38
                                                                                              local.get 24
                                                                                              local.get 16
                                                                                              local.get 18
                                                                                              i32.add
                                                                                              local.get 15
                                                                                              i32.sub
                                                                                              local.tee 15
                                                                                              i32.const 0
                                                                                              local.get 15
                                                                                              i32.const 0
                                                                                              i32.gt_s
                                                                                              select
                                                                                              local.tee 15
                                                                                              local.get 24
                                                                                              local.get 15
                                                                                              i32.lt_s
                                                                                              select
                                                                                              local.set 24
                                                                                            end
                                                                                            i32.const -1
                                                                                            local.set 15
                                                                                            local.get 24
                                                                                            i32.const 2147483645
                                                                                            i32.const 2147483646
                                                                                            local.get 24
                                                                                            local.get 38
                                                                                            i32.or
                                                                                            local.tee 40
                                                                                            select
                                                                                            i32.gt_s
                                                                                            br_if 29 (;@15;)
                                                                                            local.get 24
                                                                                            local.get 40
                                                                                            i32.const 0
                                                                                            i32.ne
                                                                                            i32.add
                                                                                            i32.const 1
                                                                                            i32.add
                                                                                            local.set 41
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                local.get 25
                                                                                                i32.const 32
                                                                                                i32.or
                                                                                                i32.const 102
                                                                                                i32.ne
                                                                                                local.tee 42
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 18
                                                                                                i32.const 2147483647
                                                                                                local.get 41
                                                                                                i32.sub
                                                                                                i32.gt_s
                                                                                                br_if 31 (;@15;)
                                                                                                local.get 18
                                                                                                i32.const 0
                                                                                                local.get 18
                                                                                                i32.const 0
                                                                                                i32.gt_s
                                                                                                select
                                                                                                local.set 18
                                                                                                br 1 (;@45;)
                                                                                              end
                                                                                              local.get 11
                                                                                              local.set 16
                                                                                              block  ;; label = @46
                                                                                                local.get 18
                                                                                                local.get 18
                                                                                                i32.const 31
                                                                                                i32.shr_s
                                                                                                local.tee 15
                                                                                                i32.add
                                                                                                local.get 15
                                                                                                i32.xor
                                                                                                local.tee 15
                                                                                                i32.eqz
                                                                                                br_if 0 (;@46;)
                                                                                                loop  ;; label = @47
                                                                                                  local.get 16
                                                                                                  i32.const -1
                                                                                                  i32.add
                                                                                                  local.tee 16
                                                                                                  local.get 15
                                                                                                  local.get 15
                                                                                                  i32.const 10
                                                                                                  i32.div_u
                                                                                                  local.tee 22
                                                                                                  i32.const 10
                                                                                                  i32.mul
                                                                                                  i32.sub
                                                                                                  i32.const 48
                                                                                                  i32.or
                                                                                                  i32.store8
                                                                                                  local.get 15
                                                                                                  i32.const 9
                                                                                                  i32.gt_u
                                                                                                  local.set 43
                                                                                                  local.get 22
                                                                                                  local.set 15
                                                                                                  local.get 43
                                                                                                  br_if 0 (;@47;)
                                                                                                end
                                                                                              end
                                                                                              block  ;; label = @46
                                                                                                local.get 11
                                                                                                local.get 16
                                                                                                i32.sub
                                                                                                i32.const 1
                                                                                                i32.gt_s
                                                                                                br_if 0 (;@46;)
                                                                                                local.get 16
                                                                                                i32.const -1
                                                                                                i32.add
                                                                                                local.set 15
                                                                                                loop  ;; label = @47
                                                                                                  local.get 15
                                                                                                  i32.const 48
                                                                                                  i32.store8
                                                                                                  local.get 11
                                                                                                  local.get 15
                                                                                                  i32.sub
                                                                                                  local.set 16
                                                                                                  local.get 15
                                                                                                  i32.const -1
                                                                                                  i32.add
                                                                                                  local.tee 22
                                                                                                  local.set 15
                                                                                                  local.get 16
                                                                                                  i32.const 2
                                                                                                  i32.lt_s
                                                                                                  br_if 0 (;@47;)
                                                                                                end
                                                                                                local.get 22
                                                                                                i32.const 1
                                                                                                i32.add
                                                                                                local.set 16
                                                                                              end
                                                                                              local.get 16
                                                                                              i32.const -2
                                                                                              i32.add
                                                                                              local.tee 43
                                                                                              local.get 25
                                                                                              i32.store8
                                                                                              i32.const -1
                                                                                              local.set 15
                                                                                              local.get 16
                                                                                              i32.const -1
                                                                                              i32.add
                                                                                              i32.const 45
                                                                                              i32.const 43
                                                                                              local.get 18
                                                                                              i32.const 0
                                                                                              i32.lt_s
                                                                                              select
                                                                                              i32.store8
                                                                                              local.get 11
                                                                                              local.get 43
                                                                                              i32.sub
                                                                                              local.tee 18
                                                                                              i32.const 2147483647
                                                                                              local.get 41
                                                                                              i32.sub
                                                                                              i32.gt_s
                                                                                              br_if 30 (;@15;)
                                                                                            end
                                                                                            i32.const -1
                                                                                            local.set 15
                                                                                            local.get 18
                                                                                            local.get 41
                                                                                            i32.add
                                                                                            local.tee 18
                                                                                            local.get 26
                                                                                            i32.const 2147483647
                                                                                            i32.xor
                                                                                            i32.gt_s
                                                                                            br_if 29 (;@15;)
                                                                                            local.get 18
                                                                                            local.get 26
                                                                                            i32.add
                                                                                            local.set 44
                                                                                            block  ;; label = @45
                                                                                              local.get 23
                                                                                              i32.const 73728
                                                                                              i32.and
                                                                                              local.tee 45
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 20
                                                                                              local.get 44
                                                                                              i32.le_s
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 5
                                                                                              i32.const 64
                                                                                              i32.add
                                                                                              i32.const 32
                                                                                              local.get 20
                                                                                              local.get 44
                                                                                              i32.sub
                                                                                              local.tee 41
                                                                                              i32.const 256
                                                                                              local.get 41
                                                                                              i32.const 256
                                                                                              i32.lt_u
                                                                                              local.tee 15
                                                                                              select
                                                                                              call $memset
                                                                                              drop
                                                                                              local.get 0
                                                                                              i32.load
                                                                                              local.tee 16
                                                                                              i32.const 32
                                                                                              i32.and
                                                                                              local.set 18
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 15
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 18
                                                                                                  i32.eqz
                                                                                                  local.set 15
                                                                                                  local.get 41
                                                                                                  local.set 18
                                                                                                  loop  ;; label = @48
                                                                                                    block  ;; label = @49
                                                                                                      local.get 15
                                                                                                      i32.const 1
                                                                                                      i32.and
                                                                                                      i32.eqz
                                                                                                      br_if 0 (;@49;)
                                                                                                      local.get 5
                                                                                                      i32.const 64
                                                                                                      i32.add
                                                                                                      i32.const 256
                                                                                                      local.get 0
                                                                                                      call $__fwritex
                                                                                                      drop
                                                                                                      local.get 0
                                                                                                      i32.load
                                                                                                      local.set 16
                                                                                                    end
                                                                                                    local.get 16
                                                                                                    i32.const 32
                                                                                                    i32.and
                                                                                                    local.tee 22
                                                                                                    i32.eqz
                                                                                                    local.set 15
                                                                                                    local.get 18
                                                                                                    i32.const -256
                                                                                                    i32.add
                                                                                                    local.tee 18
                                                                                                    i32.const 255
                                                                                                    i32.gt_u
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                  local.get 22
                                                                                                  br_if 2 (;@45;)
                                                                                                  local.get 41
                                                                                                  i32.const 255
                                                                                                  i32.and
                                                                                                  local.set 41
                                                                                                  br 1 (;@46;)
                                                                                                end
                                                                                                local.get 18
                                                                                                br_if 1 (;@45;)
                                                                                              end
                                                                                              local.get 5
                                                                                              i32.const 64
                                                                                              i32.add
                                                                                              local.get 41
                                                                                              local.get 0
                                                                                              call $__fwritex
                                                                                              drop
                                                                                            end
                                                                                            block  ;; label = @45
                                                                                              local.get 0
                                                                                              i32.load8_u
                                                                                              i32.const 32
                                                                                              i32.and
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 28
                                                                                              local.get 26
                                                                                              local.get 0
                                                                                              call $__fwritex
                                                                                              drop
                                                                                            end
                                                                                            block  ;; label = @45
                                                                                              local.get 45
                                                                                              i32.const 65536
                                                                                              i32.ne
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 20
                                                                                              local.get 44
                                                                                              i32.le_s
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 5
                                                                                              i32.const 64
                                                                                              i32.add
                                                                                              i32.const 48
                                                                                              local.get 20
                                                                                              local.get 44
                                                                                              i32.sub
                                                                                              local.tee 41
                                                                                              i32.const 256
                                                                                              local.get 41
                                                                                              i32.const 256
                                                                                              i32.lt_u
                                                                                              local.tee 15
                                                                                              select
                                                                                              call $memset
                                                                                              drop
                                                                                              local.get 0
                                                                                              i32.load
                                                                                              local.tee 16
                                                                                              i32.const 32
                                                                                              i32.and
                                                                                              local.set 18
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  local.get 15
                                                                                                  br_if 0 (;@47;)
                                                                                                  local.get 18
                                                                                                  i32.eqz
                                                                                                  local.set 15
                                                                                                  local.get 41
                                                                                                  local.set 18
                                                                                                  loop  ;; label = @48
                                                                                                    block  ;; label = @49
                                                                                                      local.get 15
                                                                                                      i32.const 1
                                                                                                      i32.and
                                                                                                      i32.eqz
                                                                                                      br_if 0 (;@49;)
                                                                                                      local.get 5
                                                                                                      i32.const 64
                                                                                                      i32.add
                                                                                                      i32.const 256
                                                                                                      local.get 0
                                                                                                      call $__fwritex
                                                                                                      drop
                                                                                                      local.get 0
                                                                                                      i32.load
                                                                                                      local.set 16
                                                                                                    end
                                                                                                    local.get 16
                                                                                                    i32.const 32
                                                                                                    i32.and
                                                                                                    local.tee 22
                                                                                                    i32.eqz
                                                                                                    local.set 15
                                                                                                    local.get 18
                                                                                                    i32.const -256
                                                                                                    i32.add
                                                                                                    local.tee 18
                                                                                                    i32.const 255
                                                                                                    i32.gt_u
                                                                                                    br_if 0 (;@48;)
                                                                                                  end
                                                                                                  local.get 22
                                                                                                  br_if 2 (;@45;)
                                                                                                  local.get 41
                                                                                                  i32.const 255
                                                                                                  i32.and
                                                                                                  local.set 41
                                                                                                  br 1 (;@46;)
                                                                                                end
                                                                                                local.get 18
                                                                                                br_if 1 (;@45;)
                                                                                              end
                                                                                              local.get 5
                                                                                              i32.const 64
                                                                                              i32.add
                                                                                              local.get 41
                                                                                              local.get 0
                                                                                              call $__fwritex
                                                                                              drop
                                                                                            end
                                                                                            local.get 42
                                                                                            br_if 3 (;@41;)
                                                                                            local.get 32
                                                                                            local.get 19
                                                                                            local.get 19
                                                                                            local.get 32
                                                                                            i32.gt_u
                                                                                            select
                                                                                            local.tee 46
                                                                                            local.set 47
                                                                                            i32.const 2
                                                                                            local.set 34
                                                                                            br 22 (;@22;)
                                                                                          end
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              local.get 47
                                                                                              i32.load
                                                                                              local.tee 15
                                                                                              i32.eqz
                                                                                              br_if 0 (;@45;)
                                                                                              i32.const 0
                                                                                              local.set 18
                                                                                              loop  ;; label = @46
                                                                                                local.get 6
                                                                                                local.get 18
                                                                                                i32.add
                                                                                                local.get 15
                                                                                                local.get 15
                                                                                                i32.const 10
                                                                                                i32.div_u
                                                                                                local.tee 16
                                                                                                i32.const 10
                                                                                                i32.mul
                                                                                                i32.sub
                                                                                                i32.const 48
                                                                                                i32.or
                                                                                                i32.store8
                                                                                                local.get 18
                                                                                                i32.const -1
                                                                                                i32.add
                                                                                                local.set 18
                                                                                                local.get 15
                                                                                                i32.const 9
                                                                                                i32.gt_u
                                                                                                local.set 22
                                                                                                local.get 16
                                                                                                local.set 15
                                                                                                local.get 22
                                                                                                br_if 0 (;@46;)
                                                                                                br 2 (;@44;)
                                                                                              end
                                                                                            end
                                                                                            i32.const 0
                                                                                            local.set 18
                                                                                          end
                                                                                          local.get 9
                                                                                          local.get 18
                                                                                          i32.add
                                                                                          local.set 15
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              local.get 47
                                                                                              local.get 46
                                                                                              i32.eq
                                                                                              br_if 0 (;@45;)
                                                                                              local.get 15
                                                                                              local.get 5
                                                                                              i32.const 336
                                                                                              i32.add
                                                                                              i32.le_u
                                                                                              br_if 1 (;@44;)
                                                                                              loop  ;; label = @46
                                                                                                local.get 15
                                                                                                i32.const -1
                                                                                                i32.add
                                                                                                local.tee 15
                                                                                                i32.const 48
                                                                                                i32.store8
                                                                                                local.get 15
                                                                                                local.get 5
                                                                                                i32.const 336
                                                                                                i32.add
                                                                                                i32.gt_u
                                                                                                br_if 0 (;@46;)
                                                                                                br 2 (;@44;)
                                                                                              end
                                                                                            end
                                                                                            local.get 18
                                                                                            br_if 0 (;@44;)
                                                                                            local.get 15
                                                                                            i32.const -1
                                                                                            i32.add
                                                                                            local.tee 15
                                                                                            i32.const 48
                                                                                            i32.store8
                                                                                          end
                                                                                          block  ;; label = @44
                                                                                            local.get 0
                                                                                            i32.load8_u
                                                                                            i32.const 32
                                                                                            i32.and
                                                                                            br_if 0 (;@44;)
                                                                                            local.get 15
                                                                                            local.get 9
                                                                                            local.get 15
                                                                                            i32.sub
                                                                                            local.get 0
                                                                                            call $__fwritex
                                                                                            drop
                                                                                          end
                                                                                          local.get 47
                                                                                          i32.const 4
                                                                                          i32.add
                                                                                          local.tee 47
                                                                                          local.get 32
                                                                                          i32.le_u
                                                                                          br_if 14 (;@29;)
                                                                                          block  ;; label = @44
                                                                                            local.get 40
                                                                                            i32.eqz
                                                                                            br_if 0 (;@44;)
                                                                                            local.get 0
                                                                                            i32.load8_u
                                                                                            i32.const 32
                                                                                            i32.and
                                                                                            br_if 0 (;@44;)
                                                                                            i32.const 3395
                                                                                            i32.const 1
                                                                                            local.get 0
                                                                                            call $__fwritex
                                                                                            drop
                                                                                          end
                                                                                          local.get 24
                                                                                          i32.const 1
                                                                                          i32.lt_s
                                                                                          br_if 1 (;@42;)
                                                                                          local.get 47
                                                                                          local.get 39
                                                                                          i32.ge_u
                                                                                          br_if 1 (;@42;)
                                                                                          i32.const 3
                                                                                          local.set 34
                                                                                          br 24 (;@19;)
                                                                                        end
                                                                                        local.get 9
                                                                                        local.set 15
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            local.get 47
                                                                                            i32.load
                                                                                            local.tee 18
                                                                                            i32.eqz
                                                                                            br_if 0 (;@44;)
                                                                                            local.get 9
                                                                                            local.set 15
                                                                                            loop  ;; label = @45
                                                                                              local.get 15
                                                                                              i32.const -1
                                                                                              i32.add
                                                                                              local.tee 15
                                                                                              local.get 18
                                                                                              local.get 18
                                                                                              i32.const 10
                                                                                              i32.div_u
                                                                                              local.tee 16
                                                                                              i32.const 10
                                                                                              i32.mul
                                                                                              i32.sub
                                                                                              i32.const 48
                                                                                              i32.or
                                                                                              i32.store8
                                                                                              local.get 18
                                                                                              i32.const 9
                                                                                              i32.gt_u
                                                                                              local.set 22
                                                                                              local.get 16
                                                                                              local.set 18
                                                                                              local.get 22
                                                                                              br_if 0 (;@45;)
                                                                                            end
                                                                                            local.get 15
                                                                                            local.get 5
                                                                                            i32.const 336
                                                                                            i32.add
                                                                                            i32.le_u
                                                                                            br_if 1 (;@43;)
                                                                                          end
                                                                                          loop  ;; label = @44
                                                                                            local.get 15
                                                                                            i32.const -1
                                                                                            i32.add
                                                                                            local.tee 15
                                                                                            i32.const 48
                                                                                            i32.store8
                                                                                            local.get 15
                                                                                            local.get 5
                                                                                            i32.const 336
                                                                                            i32.add
                                                                                            i32.gt_u
                                                                                            br_if 0 (;@44;)
                                                                                          end
                                                                                        end
                                                                                        block  ;; label = @43
                                                                                          local.get 0
                                                                                          i32.load8_u
                                                                                          i32.const 32
                                                                                          i32.and
                                                                                          br_if 0 (;@43;)
                                                                                          local.get 15
                                                                                          local.get 24
                                                                                          i32.const 9
                                                                                          local.get 24
                                                                                          i32.const 9
                                                                                          i32.lt_s
                                                                                          select
                                                                                          local.get 0
                                                                                          call $__fwritex
                                                                                          drop
                                                                                        end
                                                                                        local.get 24
                                                                                        i32.const -9
                                                                                        i32.add
                                                                                        local.tee 24
                                                                                        i32.const 1
                                                                                        i32.lt_s
                                                                                        br_if 0 (;@42;)
                                                                                        local.get 47
                                                                                        i32.const 4
                                                                                        i32.add
                                                                                        local.tee 47
                                                                                        local.get 39
                                                                                        i32.lt_u
                                                                                        br_if 14 (;@28;)
                                                                                      end
                                                                                      local.get 24
                                                                                      i32.const 1
                                                                                      i32.lt_s
                                                                                      br_if 7 (;@34;)
                                                                                      local.get 5
                                                                                      i32.const 64
                                                                                      i32.add
                                                                                      i32.const 48
                                                                                      local.get 24
                                                                                      i32.const 256
                                                                                      local.get 24
                                                                                      i32.const 256
                                                                                      i32.lt_u
                                                                                      local.tee 15
                                                                                      select
                                                                                      call $memset
                                                                                      drop
                                                                                      local.get 0
                                                                                      i32.load
                                                                                      local.tee 19
                                                                                      i32.const 32
                                                                                      i32.and
                                                                                      local.set 17
                                                                                      local.get 15
                                                                                      br_if 2 (;@39;)
                                                                                      local.get 17
                                                                                      i32.eqz
                                                                                      local.set 15
                                                                                      local.get 24
                                                                                      local.set 17
                                                                                      loop  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          local.get 15
                                                                                          i32.const 1
                                                                                          i32.and
                                                                                          i32.eqz
                                                                                          br_if 0 (;@43;)
                                                                                          local.get 5
                                                                                          i32.const 64
                                                                                          i32.add
                                                                                          i32.const 256
                                                                                          local.get 0
                                                                                          call $__fwritex
                                                                                          drop
                                                                                          local.get 0
                                                                                          i32.load
                                                                                          local.set 19
                                                                                        end
                                                                                        local.get 19
                                                                                        i32.const 32
                                                                                        i32.and
                                                                                        local.tee 18
                                                                                        i32.eqz
                                                                                        local.set 15
                                                                                        local.get 17
                                                                                        i32.const -256
                                                                                        i32.add
                                                                                        local.tee 17
                                                                                        i32.const 255
                                                                                        i32.gt_u
                                                                                        br_if 0 (;@42;)
                                                                                      end
                                                                                      local.get 18
                                                                                      br_if 7 (;@34;)
                                                                                      local.get 24
                                                                                      i32.const 255
                                                                                      i32.and
                                                                                      local.set 24
                                                                                      br 3 (;@38;)
                                                                                    end
                                                                                    local.get 24
                                                                                    i32.const -1
                                                                                    i32.le_s
                                                                                    br_if 5 (;@35;)
                                                                                    local.get 39
                                                                                    local.get 19
                                                                                    i32.const 4
                                                                                    i32.add
                                                                                    local.get 37
                                                                                    select
                                                                                    local.set 48
                                                                                    local.get 19
                                                                                    local.set 49
                                                                                    i32.const 4
                                                                                    local.set 34
                                                                                    br 22 (;@18;)
                                                                                  end
                                                                                  local.get 9
                                                                                  local.set 16
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 49
                                                                                      i32.load
                                                                                      local.tee 15
                                                                                      i32.eqz
                                                                                      br_if 0 (;@41;)
                                                                                      i32.const 0
                                                                                      local.set 18
                                                                                      loop  ;; label = @42
                                                                                        local.get 5
                                                                                        i32.const 336
                                                                                        i32.add
                                                                                        local.get 18
                                                                                        i32.add
                                                                                        i32.const 8
                                                                                        i32.add
                                                                                        local.get 15
                                                                                        local.get 15
                                                                                        i32.const 10
                                                                                        i32.div_u
                                                                                        local.tee 16
                                                                                        i32.const 10
                                                                                        i32.mul
                                                                                        i32.sub
                                                                                        i32.const 48
                                                                                        i32.or
                                                                                        i32.store8
                                                                                        local.get 18
                                                                                        i32.const -1
                                                                                        i32.add
                                                                                        local.set 18
                                                                                        local.get 15
                                                                                        i32.const 9
                                                                                        i32.gt_u
                                                                                        local.set 22
                                                                                        local.get 16
                                                                                        local.set 15
                                                                                        local.get 22
                                                                                        br_if 0 (;@42;)
                                                                                      end
                                                                                      local.get 5
                                                                                      i32.const 336
                                                                                      i32.add
                                                                                      local.get 18
                                                                                      i32.add
                                                                                      i32.const 9
                                                                                      i32.add
                                                                                      local.set 16
                                                                                      local.get 18
                                                                                      br_if 1 (;@40;)
                                                                                    end
                                                                                    local.get 16
                                                                                    i32.const -1
                                                                                    i32.add
                                                                                    local.tee 16
                                                                                    i32.const 48
                                                                                    i32.store8
                                                                                  end
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 49
                                                                                      local.get 19
                                                                                      i32.eq
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 16
                                                                                      local.get 5
                                                                                      i32.const 336
                                                                                      i32.add
                                                                                      i32.le_u
                                                                                      br_if 1 (;@40;)
                                                                                      loop  ;; label = @42
                                                                                        local.get 16
                                                                                        i32.const -1
                                                                                        i32.add
                                                                                        local.tee 16
                                                                                        i32.const 48
                                                                                        i32.store8
                                                                                        local.get 16
                                                                                        local.get 5
                                                                                        i32.const 336
                                                                                        i32.add
                                                                                        i32.gt_u
                                                                                        br_if 0 (;@42;)
                                                                                        br 2 (;@40;)
                                                                                      end
                                                                                    end
                                                                                    block  ;; label = @41
                                                                                      local.get 0
                                                                                      i32.load8_u
                                                                                      i32.const 32
                                                                                      i32.and
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 16
                                                                                      i32.const 1
                                                                                      local.get 0
                                                                                      call $__fwritex
                                                                                      drop
                                                                                    end
                                                                                    local.get 16
                                                                                    i32.const 1
                                                                                    i32.add
                                                                                    local.set 16
                                                                                    block  ;; label = @41
                                                                                      local.get 38
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 24
                                                                                      i32.const 1
                                                                                      i32.lt_s
                                                                                      br_if 1 (;@40;)
                                                                                    end
                                                                                    local.get 0
                                                                                    i32.load8_u
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    br_if 0 (;@40;)
                                                                                    i32.const 3395
                                                                                    i32.const 1
                                                                                    local.get 0
                                                                                    call $__fwritex
                                                                                    drop
                                                                                  end
                                                                                  local.get 9
                                                                                  local.get 16
                                                                                  i32.sub
                                                                                  local.set 15
                                                                                  block  ;; label = @40
                                                                                    local.get 0
                                                                                    i32.load8_u
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    br_if 0 (;@40;)
                                                                                    local.get 16
                                                                                    local.get 15
                                                                                    local.get 24
                                                                                    local.get 24
                                                                                    local.get 15
                                                                                    i32.gt_s
                                                                                    select
                                                                                    local.get 0
                                                                                    call $__fwritex
                                                                                    drop
                                                                                  end
                                                                                  local.get 24
                                                                                  local.get 15
                                                                                  i32.sub
                                                                                  local.set 24
                                                                                  block  ;; label = @40
                                                                                    local.get 49
                                                                                    i32.const 4
                                                                                    i32.add
                                                                                    local.tee 49
                                                                                    local.get 48
                                                                                    i32.ge_u
                                                                                    br_if 0 (;@40;)
                                                                                    local.get 24
                                                                                    i32.const -1
                                                                                    i32.gt_s
                                                                                    br_if 13 (;@27;)
                                                                                  end
                                                                                  local.get 24
                                                                                  i32.const 1
                                                                                  i32.lt_s
                                                                                  br_if 4 (;@35;)
                                                                                  local.get 5
                                                                                  i32.const 64
                                                                                  i32.add
                                                                                  i32.const 48
                                                                                  local.get 24
                                                                                  i32.const 256
                                                                                  local.get 24
                                                                                  i32.const 256
                                                                                  i32.lt_u
                                                                                  local.tee 17
                                                                                  select
                                                                                  call $memset
                                                                                  drop
                                                                                  local.get 0
                                                                                  i32.load
                                                                                  local.tee 19
                                                                                  i32.const 32
                                                                                  i32.and
                                                                                  local.set 15
                                                                                  local.get 17
                                                                                  br_if 2 (;@37;)
                                                                                  local.get 15
                                                                                  i32.eqz
                                                                                  local.set 15
                                                                                  local.get 24
                                                                                  local.set 17
                                                                                  loop  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      local.get 15
                                                                                      i32.const 1
                                                                                      i32.and
                                                                                      i32.eqz
                                                                                      br_if 0 (;@41;)
                                                                                      local.get 5
                                                                                      i32.const 64
                                                                                      i32.add
                                                                                      i32.const 256
                                                                                      local.get 0
                                                                                      call $__fwritex
                                                                                      drop
                                                                                      local.get 0
                                                                                      i32.load
                                                                                      local.set 19
                                                                                    end
                                                                                    local.get 19
                                                                                    i32.const 32
                                                                                    i32.and
                                                                                    local.tee 18
                                                                                    i32.eqz
                                                                                    local.set 15
                                                                                    local.get 17
                                                                                    i32.const -256
                                                                                    i32.add
                                                                                    local.tee 17
                                                                                    i32.const 255
                                                                                    i32.gt_u
                                                                                    br_if 0 (;@40;)
                                                                                  end
                                                                                  local.get 18
                                                                                  br_if 4 (;@35;)
                                                                                  local.get 24
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  local.set 24
                                                                                  br 3 (;@36;)
                                                                                end
                                                                                local.get 17
                                                                                br_if 4 (;@34;)
                                                                              end
                                                                              local.get 5
                                                                              i32.const 64
                                                                              i32.add
                                                                              local.get 24
                                                                              local.get 0
                                                                              call $__fwritex
                                                                              drop
                                                                              local.get 45
                                                                              i32.const 8192
                                                                              i32.eq
                                                                              br_if 4 (;@33;)
                                                                              br 5 (;@32;)
                                                                            end
                                                                            local.get 15
                                                                            br_if 1 (;@35;)
                                                                          end
                                                                          local.get 5
                                                                          i32.const 64
                                                                          i32.add
                                                                          local.get 24
                                                                          local.get 0
                                                                          call $__fwritex
                                                                          drop
                                                                        end
                                                                        local.get 0
                                                                        i32.load8_u
                                                                        i32.const 32
                                                                        i32.and
                                                                        br_if 0 (;@34;)
                                                                        local.get 43
                                                                        local.get 11
                                                                        local.get 43
                                                                        i32.sub
                                                                        local.get 0
                                                                        call $__fwritex
                                                                        drop
                                                                      end
                                                                      local.get 45
                                                                      i32.const 8192
                                                                      i32.ne
                                                                      br_if 1 (;@32;)
                                                                    end
                                                                    local.get 20
                                                                    local.get 44
                                                                    i32.le_s
                                                                    br_if 0 (;@32;)
                                                                    local.get 5
                                                                    i32.const 64
                                                                    i32.add
                                                                    i32.const 32
                                                                    local.get 20
                                                                    local.get 44
                                                                    i32.sub
                                                                    local.tee 16
                                                                    i32.const 256
                                                                    local.get 16
                                                                    i32.const 256
                                                                    i32.lt_u
                                                                    local.tee 15
                                                                    select
                                                                    call $memset
                                                                    drop
                                                                    local.get 0
                                                                    i32.load
                                                                    local.tee 19
                                                                    i32.const 32
                                                                    i32.and
                                                                    local.set 17
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        local.get 15
                                                                        br_if 0 (;@34;)
                                                                        local.get 17
                                                                        i32.eqz
                                                                        local.set 15
                                                                        local.get 16
                                                                        local.set 17
                                                                        loop  ;; label = @35
                                                                          block  ;; label = @36
                                                                            local.get 15
                                                                            i32.const 1
                                                                            i32.and
                                                                            i32.eqz
                                                                            br_if 0 (;@36;)
                                                                            local.get 5
                                                                            i32.const 64
                                                                            i32.add
                                                                            i32.const 256
                                                                            local.get 0
                                                                            call $__fwritex
                                                                            drop
                                                                            local.get 0
                                                                            i32.load
                                                                            local.set 19
                                                                          end
                                                                          local.get 19
                                                                          i32.const 32
                                                                          i32.and
                                                                          local.tee 18
                                                                          i32.eqz
                                                                          local.set 15
                                                                          local.get 17
                                                                          i32.const -256
                                                                          i32.add
                                                                          local.tee 17
                                                                          i32.const 255
                                                                          i32.gt_u
                                                                          br_if 0 (;@35;)
                                                                        end
                                                                        local.get 18
                                                                        br_if 2 (;@32;)
                                                                        local.get 16
                                                                        i32.const 255
                                                                        i32.and
                                                                        local.set 16
                                                                        br 1 (;@33;)
                                                                      end
                                                                      local.get 17
                                                                      br_if 1 (;@32;)
                                                                    end
                                                                    local.get 5
                                                                    i32.const 64
                                                                    i32.add
                                                                    local.get 16
                                                                    local.get 0
                                                                    call $__fwritex
                                                                    drop
                                                                  end
                                                                  local.get 20
                                                                  local.get 44
                                                                  local.get 20
                                                                  local.get 44
                                                                  i32.gt_s
                                                                  select
                                                                  local.set 15
                                                                  br 16 (;@15;)
                                                                end
                                                                i32.const 0
                                                                local.set 34
                                                                br 5 (;@25;)
                                                              end
                                                              i32.const 1
                                                              local.set 34
                                                              br 6 (;@23;)
                                                            end
                                                            i32.const 2
                                                            local.set 34
                                                            br 7 (;@21;)
                                                          end
                                                          i32.const 3
                                                          local.set 34
                                                          br 7 (;@20;)
                                                        end
                                                        i32.const 4
                                                        local.set 34
                                                        br 9 (;@17;)
                                                      end
                                                      i32.const 0
                                                      local.set 15
                                                      br 9 (;@16;)
                                                    end
                                                    i32.const 1
                                                    local.set 15
                                                    br 8 (;@16;)
                                                  end
                                                  i32.const 1
                                                  local.set 15
                                                  br 7 (;@16;)
                                                end
                                                i32.const 1
                                                local.set 15
                                                br 6 (;@16;)
                                              end
                                              i32.const 1
                                              local.set 15
                                              br 5 (;@16;)
                                            end
                                            i32.const 1
                                            local.set 15
                                            br 4 (;@16;)
                                          end
                                          i32.const 1
                                          local.set 15
                                          br 3 (;@16;)
                                        end
                                        i32.const 1
                                        local.set 15
                                        br 2 (;@16;)
                                      end
                                      i32.const 1
                                      local.set 15
                                      br 1 (;@16;)
                                    end
                                    i32.const 1
                                    local.set 15
                                    br 0 (;@16;)
                                  end
                                end
                                local.get 15
                                i32.const 0
                                i32.ge_s
                                br_if 10 (;@4;)
                                br 11 (;@3;)
                              end
                              local.get 20
                              local.get 15
                              i32.le_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 64
                              i32.add
                              i32.const 32
                              local.get 20
                              local.get 15
                              i32.sub
                              local.tee 25
                              i32.const 256
                              local.get 25
                              i32.const 256
                              i32.lt_u
                              local.tee 17
                              select
                              call $memset
                              drop
                              local.get 0
                              i32.load
                              local.tee 16
                              i32.const 32
                              i32.and
                              local.set 19
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 17
                                  br_if 0 (;@15;)
                                  local.get 19
                                  i32.eqz
                                  local.set 17
                                  local.get 25
                                  local.set 19
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 17
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 16
                                    end
                                    local.get 16
                                    i32.const 32
                                    i32.and
                                    local.tee 22
                                    i32.eqz
                                    local.set 17
                                    local.get 19
                                    i32.const -256
                                    i32.add
                                    local.tee 19
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 22
                                  br_if 2 (;@13;)
                                  local.get 25
                                  i32.const 255
                                  i32.and
                                  local.set 25
                                  br 1 (;@14;)
                                end
                                local.get 19
                                br_if 1 (;@13;)
                              end
                              local.get 5
                              i32.const 64
                              i32.add
                              local.get 25
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              local.get 15
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 17
                              loop  ;; label = @14
                                local.get 18
                                i32.load
                                local.tee 19
                                i32.eqz
                                br_if 1 (;@13;)
                                local.get 5
                                i32.const 4
                                i32.add
                                local.get 19
                                call $wctomb
                                local.tee 19
                                local.get 17
                                i32.add
                                local.tee 17
                                local.get 15
                                i32.gt_u
                                br_if 1 (;@13;)
                                block  ;; label = @15
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.const 4
                                  i32.add
                                  local.get 19
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 18
                                i32.const 4
                                i32.add
                                local.set 18
                                local.get 17
                                local.get 15
                                i32.lt_u
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 23
                              i32.const 8192
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 20
                              local.get 15
                              i32.le_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 64
                              i32.add
                              i32.const 32
                              local.get 20
                              local.get 15
                              i32.sub
                              local.tee 22
                              i32.const 256
                              local.get 22
                              i32.const 256
                              i32.lt_u
                              local.tee 17
                              select
                              call $memset
                              drop
                              local.get 0
                              i32.load
                              local.tee 18
                              i32.const 32
                              i32.and
                              local.set 19
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 17
                                  br_if 0 (;@15;)
                                  local.get 19
                                  i32.eqz
                                  local.set 17
                                  local.get 22
                                  local.set 19
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 17
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 18
                                    end
                                    local.get 18
                                    i32.const 32
                                    i32.and
                                    local.tee 16
                                    i32.eqz
                                    local.set 17
                                    local.get 19
                                    i32.const -256
                                    i32.add
                                    local.tee 19
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 16
                                  br_if 2 (;@13;)
                                  local.get 22
                                  i32.const 255
                                  i32.and
                                  local.set 22
                                  br 1 (;@14;)
                                end
                                local.get 19
                                br_if 1 (;@13;)
                              end
                              local.get 5
                              i32.const 64
                              i32.add
                              local.get 22
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 20
                            local.get 15
                            local.get 20
                            local.get 15
                            i32.gt_s
                            select
                            local.set 15
                            br 8 (;@4;)
                          end
                          local.get 31
                          local.set 33
                          local.get 12
                          local.set 18
                          br 1 (;@10;)
                        end
                        local.get 12
                        local.set 18
                        loop  ;; label = @11
                          local.get 18
                          i32.const -1
                          i32.add
                          local.tee 18
                          local.get 31
                          local.get 31
                          i64.const 10
                          i64.div_u
                          local.tee 33
                          i64.const 10
                          i64.mul
                          i64.sub
                          i32.wrap_i64
                          i32.const 48
                          i32.or
                          i32.store8
                          local.get 31
                          i64.const 42949672959
                          i64.gt_u
                          local.set 15
                          local.get 33
                          local.set 31
                          local.get 15
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 33
                      i32.wrap_i64
                      local.tee 15
                      i32.eqz
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        local.get 18
                        i32.const -1
                        i32.add
                        local.tee 18
                        local.get 15
                        local.get 15
                        i32.const 10
                        i32.div_u
                        local.tee 19
                        i32.const 10
                        i32.mul
                        i32.sub
                        i32.const 48
                        i32.or
                        i32.store8
                        local.get 15
                        i32.const 9
                        i32.gt_u
                        local.set 22
                        local.get 19
                        local.set 15
                        local.get 22
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 24
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  local.get 16
                  i32.const 0
                  i32.lt_s
                  br_if 4 (;@3;)
                end
                local.get 23
                i32.const -65537
                i32.and
                local.get 23
                local.get 24
                select
                local.set 23
                local.get 5
                i64.load offset=56
                local.set 31
                block  ;; label = @7
                  local.get 16
                  br_if 0 (;@7;)
                  local.get 31
                  i64.eqz
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 12
                  local.set 18
                  local.get 12
                  local.set 15
                  i32.const 0
                  local.set 16
                  br 2 (;@5;)
                end
                local.get 16
                local.get 12
                local.get 18
                i32.sub
                local.get 31
                i64.eqz
                i32.add
                local.tee 15
                local.get 16
                local.get 15
                i32.gt_s
                select
                local.set 16
              end
              local.get 12
              local.set 15
            end
            local.get 15
            local.get 18
            i32.sub
            local.tee 24
            local.get 16
            local.get 16
            local.get 24
            i32.lt_s
            select
            local.tee 28
            i32.const 2147483647
            local.get 21
            i32.sub
            i32.gt_s
            br_if 1 (;@3;)
            local.get 21
            local.get 28
            i32.add
            local.tee 25
            local.get 20
            local.get 20
            local.get 25
            i32.lt_s
            select
            local.tee 15
            local.get 17
            i32.gt_s
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 23
              i32.const 73728
              i32.and
              local.tee 26
              br_if 0 (;@5;)
              local.get 25
              local.get 20
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              i32.add
              i32.const 32
              local.get 15
              local.get 25
              i32.sub
              local.tee 37
              i32.const 256
              local.get 37
              i32.const 256
              i32.lt_u
              local.tee 17
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 22
              i32.const 32
              i32.and
              local.set 19
              block  ;; label = @6
                block  ;; label = @7
                  local.get 17
                  br_if 0 (;@7;)
                  local.get 19
                  i32.eqz
                  local.set 17
                  local.get 37
                  local.set 19
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 17
                      i32.const 1
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                      local.get 0
                      i32.load
                      local.set 22
                    end
                    local.get 22
                    i32.const 32
                    i32.and
                    local.tee 23
                    i32.eqz
                    local.set 17
                    local.get 19
                    i32.const -256
                    i32.add
                    local.tee 19
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                  local.get 23
                  br_if 2 (;@5;)
                  local.get 37
                  i32.const 255
                  i32.and
                  local.set 37
                  br 1 (;@6;)
                end
                local.get 19
                br_if 1 (;@5;)
              end
              local.get 5
              i32.const 64
              i32.add
              local.get 37
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 32
              local.get 21
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 26
              i32.const 65536
              i32.ne
              br_if 0 (;@5;)
              local.get 25
              local.get 20
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              i32.add
              i32.const 48
              local.get 15
              local.get 25
              i32.sub
              local.tee 21
              i32.const 256
              local.get 21
              i32.const 256
              i32.lt_u
              local.tee 17
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 22
              i32.const 32
              i32.and
              local.set 19
              block  ;; label = @6
                block  ;; label = @7
                  local.get 17
                  br_if 0 (;@7;)
                  local.get 19
                  i32.eqz
                  local.set 17
                  local.get 21
                  local.set 19
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 17
                      i32.const 1
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                      local.get 0
                      i32.load
                      local.set 22
                    end
                    local.get 22
                    i32.const 32
                    i32.and
                    local.tee 23
                    i32.eqz
                    local.set 17
                    local.get 19
                    i32.const -256
                    i32.add
                    local.tee 19
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                  local.get 23
                  br_if 2 (;@5;)
                  local.get 21
                  i32.const 255
                  i32.and
                  local.set 21
                  br 1 (;@6;)
                end
                local.get 19
                br_if 1 (;@5;)
              end
              local.get 5
              i32.const 64
              i32.add
              local.get 21
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 24
              local.get 16
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              i32.add
              i32.const 48
              local.get 28
              local.get 24
              i32.sub
              local.tee 23
              i32.const 256
              local.get 23
              i32.const 256
              i32.lt_u
              local.tee 17
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 16
              i32.const 32
              i32.and
              local.set 19
              block  ;; label = @6
                block  ;; label = @7
                  local.get 17
                  br_if 0 (;@7;)
                  local.get 19
                  i32.eqz
                  local.set 17
                  local.get 23
                  local.set 19
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 17
                      i32.const 1
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                      local.get 0
                      i32.load
                      local.set 16
                    end
                    local.get 16
                    i32.const 32
                    i32.and
                    local.tee 22
                    i32.eqz
                    local.set 17
                    local.get 19
                    i32.const -256
                    i32.add
                    local.tee 19
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                  local.get 22
                  br_if 2 (;@5;)
                  local.get 23
                  i32.const 255
                  i32.and
                  local.set 23
                  br 1 (;@6;)
                end
                local.get 19
                br_if 1 (;@5;)
              end
              local.get 5
              i32.const 64
              i32.add
              local.get 23
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 18
              local.get 24
              local.get 0
              call $__fwritex
              drop
            end
            local.get 26
            i32.const 8192
            i32.ne
            br_if 0 (;@4;)
            local.get 25
            local.get 20
            i32.ge_s
            br_if 0 (;@4;)
            local.get 5
            i32.const 64
            i32.add
            i32.const 32
            local.get 15
            local.get 25
            i32.sub
            local.tee 16
            i32.const 256
            local.get 16
            i32.const 256
            i32.lt_u
            local.tee 19
            select
            call $memset
            drop
            local.get 0
            i32.load
            local.tee 18
            i32.const 32
            i32.and
            local.set 17
            block  ;; label = @5
              block  ;; label = @6
                local.get 19
                i32.eqz
                br_if 0 (;@6;)
                local.get 17
                i32.eqz
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              local.get 17
              i32.eqz
              local.set 17
              local.get 16
              local.set 19
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 17
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 64
                  i32.add
                  i32.const 256
                  local.get 0
                  call $__fwritex
                  drop
                  local.get 0
                  i32.load
                  local.set 18
                end
                local.get 18
                i32.const 32
                i32.and
                local.tee 20
                i32.eqz
                local.set 17
                local.get 19
                i32.const -256
                i32.add
                local.tee 19
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
              end
              local.get 20
              br_if 1 (;@4;)
              local.get 16
              i32.const 255
              i32.and
              local.set 16
            end
            local.get 5
            i32.const 64
            i32.add
            local.get 16
            local.get 0
            call $__fwritex
            drop
            br 0 (;@4;)
          end
        end
        i32.const 0
        i32.const 61
        i32.store offset=3904
      end
      i32.const -1
      local.set 14
    end
    local.get 5
    i32.const 880
    i32.add
    global.set 0
    local.get 14)
  (func $pop_arg (type 9) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 1
                                        i32.const -9
                                        i32.add
                                        local.tee 1
                                        i32.const 17
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        block  ;; label = @19
                                          local.get 1
                                          br_table 0 (;@19;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 5 (;@14;) 13 (;@6;) 14 (;@5;) 11 (;@8;) 15 (;@4;) 6 (;@13;) 16 (;@3;) 4 (;@15;) 7 (;@12;) 17 (;@2;) 3 (;@16;) 12 (;@7;) 2 (;@17;) 18 (;@1;) 0 (;@19;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 1
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 0
                                        local.get 1
                                        i32.load
                                        i32.store
                                      end
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i32.load
                                    i32.const 7
                                    i32.add
                                    i32.const -8
                                    i32.and
                                    local.tee 1
                                    i32.const 8
                                    i32.add
                                    i32.store
                                    local.get 0
                                    local.get 1
                                    i64.load
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 1
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 0
                                  local.get 1
                                  i64.load32_s
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                local.tee 1
                                i32.const 4
                                i32.add
                                i32.store
                                local.get 0
                                local.get 1
                                i64.load32_u
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 0
                              local.get 1
                              i64.load32_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 1
                            i64.load8_u
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i32.load
                          i32.const 7
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 1
                          i32.const 8
                          i32.add
                          i32.store
                          local.get 0
                          local.get 1
                          i64.load
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i64.load32_s
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      local.tee 1
                      i32.const 4
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load32_u
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    i32.const 7
                    i32.add
                    i32.const -8
                    i32.and
                    local.tee 1
                    i32.const 8
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  local.tee 1
                  i32.const 4
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load16_u
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                local.tee 1
                i32.const 4
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load32_u
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load32_u
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load16_s
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          local.tee 1
          i32.const 4
          i32.add
          i32.store
          local.get 0
          local.get 1
          i64.load8_s
          i64.store
          return
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 7
        i32.add
        i32.const -8
        i32.and
        local.tee 1
        i32.const 8
        i32.add
        i32.store
        local.get 0
        local.get 1
        i64.load
        i64.store
        return
      end
      local.get 2
      local.get 2
      i32.load
      i32.const 7
      i32.add
      i32.const -8
      i32.and
      local.tee 1
      i32.const 8
      i32.add
      i32.store
      local.get 0
      local.get 1
      i64.load
      i64.store
      return
    end
    call $long_double_not_supported
    unreachable)
  (func $long_double_not_supported (type 7)
    i32.const 3200
    i32.const 5120
    call $fputs
    drop
    call $abort
    unreachable)
  (func $fprintf (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    call $vfprintf
    local.set 2
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 2)
  (func $__isatty (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 1
          i32.const 8
          i32.add
          call $__wasi_fd_fdstat_get
          local.tee 0
          br_if 0 (;@3;)
          i32.const 59
          local.set 0
          local.get 1
          i32.load8_u offset=8
          i32.const 2
          i32.ne
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u offset=16
          i32.const 36
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        local.get 0
        i32.store offset=3904
        br 1 (;@1;)
      end
      i32.const 1
      local.set 2
    end
    local.get 1
    i32.const 32
    i32.add
    global.set 0
    local.get 2)
  (func $__stdout_write (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 4
    i32.store offset=32
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=56
        call $__isatty
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 2
      call $__stdio_write
      return
    end
    local.get 0
    i32.const -1
    i32.store offset=64
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write)
  (func $__ofl_lock (type 10) (result i32)
    i32.const 4980)
  (func $__stdio_exit (type 7)
    (local i32 i32 i32)
    block  ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=24
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=32
          call_indirect (type 0)
          drop
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          i32.sub
          i64.extend_i32_s
          i32.const 0
          local.get 0
          i32.load offset=36
          call_indirect (type 1)
          drop
        end
        local.get 0
        i32.load offset=52
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=4984
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=5112
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=5232
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end)
  (func $__towrite (type 4) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=60
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=60
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i64.const 0
      i64.store offset=4 align=4
      local.get 0
      local.get 0
      i32.load offset=40
      local.tee 1
      i32.store offset=24
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=44
      i32.add
      i32.store offset=16
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 32
    i32.or
    i32.store
    i32.const -1)
  (func $__fwritex (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 6
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.const 16
        i32.add
        i32.load
        local.set 3
      end
      block  ;; label = @2
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 4
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=32
        call_indirect (type 0)
        return
      end
      i32.const 0
      local.set 5
      block  ;; label = @2
        local.get 2
        i32.load offset=64
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        local.get 0
        local.set 6
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 1
          local.get 3
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 6
          local.get 1
          i32.add
          local.set 7
          local.get 6
          i32.const -1
          i32.add
          local.tee 8
          local.set 6
          local.get 7
          i32.const -1
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.sub
        i32.const 1
        i32.add
        local.tee 5
        local.get 2
        i32.load offset=32
        call_indirect (type 0)
        local.tee 6
        local.get 5
        i32.lt_u
        br_if 1 (;@1;)
        local.get 8
        local.get 1
        i32.add
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const 20
        i32.add
        i32.load
        local.set 4
        local.get 3
        i32.const -1
        i32.add
        local.set 1
      end
      local.get 4
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      i32.const 20
      i32.add
      local.tee 3
      local.get 3
      i32.load
      local.get 1
      i32.add
      i32.store
      local.get 5
      local.get 1
      i32.add
      return
    end
    local.get 6)
  (func $fwrite (type 6) (param i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 2
      local.get 1
      i32.mul
      local.tee 4
      local.get 3
      call $__fwritex
      local.tee 0
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 0
    local.get 1
    i32.div_u)
  (func $writev (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const -1
          i32.le_s
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          i32.const 12
          i32.add
          call $__wasi_fd_write
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          i32.const 0
          local.get 2
          i32.store offset=3904
          i32.const -1
          local.set 4
          br 2 (;@1;)
        end
        i32.const 0
        i32.const 28
        i32.store offset=3904
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 4)
  (func $__stdio_write (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=24
    local.tee 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=20
    local.get 1
    i32.sub
    local.tee 1
    i32.store offset=4
    i32.const 2
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.add
          local.tee 5
          local.get 0
          i32.load offset=56
          local.get 3
          i32.const 2
          call $writev
          local.tee 6
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          local.set 1
          local.get 0
          i32.const 56
          i32.add
          local.set 7
          loop  ;; label = @4
            local.get 6
            i32.const -1
            i32.le_s
            br_if 2 (;@2;)
            local.get 1
            i32.const 8
            i32.add
            local.get 1
            local.get 6
            local.get 1
            i32.load offset=4
            local.tee 8
            i32.gt_u
            local.tee 9
            select
            local.tee 1
            local.get 1
            i32.load
            local.get 6
            local.get 8
            i32.const 0
            local.get 9
            select
            i32.sub
            local.tee 8
            i32.add
            i32.store
            local.get 1
            local.get 1
            i32.load offset=4
            local.get 8
            i32.sub
            i32.store offset=4
            local.get 5
            local.get 6
            i32.sub
            local.set 5
            local.get 7
            i32.load
            local.get 1
            local.get 4
            local.get 9
            i32.sub
            local.tee 4
            call $writev
            local.tee 9
            local.set 6
            local.get 5
            local.get 9
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.load offset=40
        local.tee 1
        i32.store
        local.get 0
        i32.const 20
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=44
        i32.add
        i32.store offset=16
        local.get 2
        local.set 6
        br 1 (;@1;)
      end
      local.get 0
      i64.const 0
      i64.store offset=16
      i32.const 0
      local.set 6
      local.get 0
      i32.const 24
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      local.get 4
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load offset=4
      i32.sub
      local.set 6
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 6)
  (func $strdup (type 4) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      return
    end
    i32.const 0)
  (func $strlen (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.load8_u
            local.set 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            local.set 1
            local.get 2
            br_if 0 (;@4;)
          end
          local.get 3
          i32.const -1
          i32.add
          local.get 0
          i32.sub
          return
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 255
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 1
          i32.load8_u offset=1
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          local.set 1
          local.get 2
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 0
        i32.sub
        return
      end
      local.get 0
      local.get 0
      i32.sub
      return
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $strnlen (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i32.sub
    local.get 1
    local.get 2
    select)
  (func $memcpy (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.set 3
            block  ;; label = @5
              loop  ;; label = @6
                local.get 3
                local.get 1
                i32.load8_u
                i32.store8
                local.get 2
                i32.const -1
                i32.add
                local.set 4
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 2
                i32.const 1
                i32.eq
                br_if 1 (;@5;)
                local.get 4
                local.set 2
                local.get 1
                i32.const 3
                i32.and
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.const 3
            i32.and
            local.tee 2
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 2
          local.set 4
          local.get 0
          local.tee 3
          i32.const 3
          i32.and
          local.tee 2
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const -16
            i32.add
            local.set 2
            loop  ;; label = @5
              local.get 3
              local.get 1
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 16
              i32.add
              local.set 3
              local.get 1
              i32.const 16
              i32.add
              local.set 1
              local.get 4
              i32.const -16
              i32.add
              local.tee 4
              i32.const 15
              i32.gt_u
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 4
          local.set 2
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i64.load align=4
          i64.store align=4
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 8
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 3
          i32.const 4
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 3
          i32.const 2
          i32.add
          local.set 3
          local.get 1
          i32.const 2
          i32.add
          local.set 1
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i32.const 2
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 1
            i32.ne
            br_if 2 (;@2;)
            local.get 3
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 3
            local.get 1
            i32.load
            local.tee 5
            i32.store8
            local.get 3
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 4
            i32.const -3
            i32.add
            local.set 6
            local.get 3
            i32.const 3
            i32.add
            local.set 7
            local.get 4
            i32.const -20
            i32.add
            i32.const -16
            i32.and
            local.set 8
            i32.const 0
            local.set 2
            loop  ;; label = @5
              local.get 7
              local.get 2
              i32.add
              local.tee 3
              local.get 1
              local.get 2
              i32.add
              local.tee 9
              i32.const 4
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 9
              i32.const 8
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 9
              i32.const 12
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 9
              i32.const 16
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.const -16
              i32.add
              local.tee 6
              i32.const 16
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 7
            local.get 2
            i32.add
            local.set 3
            local.get 1
            local.get 2
            i32.add
            i32.const 3
            i32.add
            local.set 1
            local.get 4
            i32.const -19
            i32.add
            local.get 8
            i32.sub
            local.set 4
            br 2 (;@2;)
          end
          local.get 3
          local.get 1
          i32.load
          local.tee 5
          i32.store8
          local.get 4
          i32.const -1
          i32.add
          local.set 6
          local.get 3
          i32.const 1
          i32.add
          local.set 7
          local.get 4
          i32.const -20
          i32.add
          i32.const -16
          i32.and
          local.set 8
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 7
            local.get 2
            i32.add
            local.tee 3
            local.get 1
            local.get 2
            i32.add
            local.tee 9
            i32.const 4
            i32.add
            i32.load
            local.tee 10
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 4
            i32.add
            local.get 9
            i32.const 8
            i32.add
            i32.load
            local.tee 5
            i32.const 24
            i32.shl
            local.get 10
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 8
            i32.add
            local.get 9
            i32.const 12
            i32.add
            i32.load
            local.tee 10
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 12
            i32.add
            local.get 9
            i32.const 16
            i32.add
            i32.load
            local.tee 5
            i32.const 24
            i32.shl
            local.get 10
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 2
            i32.const 16
            i32.add
            local.set 2
            local.get 6
            i32.const -16
            i32.add
            local.tee 6
            i32.const 18
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 7
          local.get 2
          i32.add
          local.set 3
          local.get 1
          local.get 2
          i32.add
          i32.const 1
          i32.add
          local.set 1
          local.get 4
          i32.const -17
          i32.add
          local.get 8
          i32.sub
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 1
        i32.load
        local.tee 5
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 4
        i32.const -2
        i32.add
        local.set 6
        local.get 3
        i32.const 2
        i32.add
        local.set 7
        local.get 4
        i32.const -20
        i32.add
        i32.const -16
        i32.and
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 7
          local.get 2
          i32.add
          local.tee 3
          local.get 1
          local.get 2
          i32.add
          local.tee 9
          i32.const 4
          i32.add
          i32.load
          local.tee 10
          i32.const 16
          i32.shl
          local.get 5
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 4
          i32.add
          local.get 9
          i32.const 8
          i32.add
          i32.load
          local.tee 5
          i32.const 16
          i32.shl
          local.get 10
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 8
          i32.add
          local.get 9
          i32.const 12
          i32.add
          i32.load
          local.tee 10
          i32.const 16
          i32.shl
          local.get 5
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 12
          i32.add
          local.get 9
          i32.const 16
          i32.add
          i32.load
          local.tee 5
          i32.const 16
          i32.shl
          local.get 10
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 6
          i32.const -16
          i32.add
          local.tee 6
          i32.const 17
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 7
        local.get 2
        i32.add
        local.set 3
        local.get 1
        local.get 2
        i32.add
        i32.const 2
        i32.add
        local.set 1
        local.get 4
        i32.const -18
        i32.add
        local.get 8
        i32.sub
        local.set 4
      end
      block  ;; label = @2
        local.get 4
        i32.const 16
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        local.get 1
        i32.load8_u offset=8
        i32.store8 offset=8
        local.get 3
        local.get 1
        i32.load8_u offset=9
        i32.store8 offset=9
        local.get 3
        local.get 1
        i32.load8_u offset=10
        i32.store8 offset=10
        local.get 3
        local.get 1
        i32.load8_u offset=11
        i32.store8 offset=11
        local.get 3
        local.get 1
        i32.load8_u offset=12
        i32.store8 offset=12
        local.get 3
        local.get 1
        i32.load8_u offset=13
        i32.store8 offset=13
        local.get 3
        local.get 1
        i32.load8_u offset=14
        i32.store8 offset=14
        local.get 3
        local.get 1
        i32.load8_u offset=15
        i32.store8 offset=15
        local.get 3
        i32.const 16
        i32.add
        local.set 3
        local.get 1
        i32.const 16
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        i32.const 2
        i32.add
        local.set 3
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 5
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 6
      i64.const 32
      i64.shl
      local.get 6
      i64.or
      local.set 6
      local.get 3
      local.get 5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 6
        i64.store
        local.get 1
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $memchr (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const 255
              i32.and
              local.set 3
              loop  ;; label = @6
                local.get 0
                i32.load8_u
                local.get 3
                i32.eq
                br_if 2 (;@4;)
                local.get 2
                i32.const 1
                i32.ne
                local.set 4
                local.get 2
                i32.const -1
                i32.add
                local.set 5
                local.get 0
                i32.const 1
                i32.add
                local.set 0
                block  ;; label = @7
                  local.get 2
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 5
                  local.set 2
                  local.get 0
                  i32.const 3
                  i32.and
                  br_if 1 (;@6;)
                end
              end
              local.get 4
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 2
            local.set 5
            local.get 3
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 2
          local.set 5
        end
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 3
          loop  ;; label = @4
            local.get 0
            i32.load
            local.get 3
            i32.xor
            local.tee 2
            i32.const -1
            i32.xor
            local.get 2
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            local.get 5
            i32.const -4
            i32.add
            local.tee 5
            i32.const 3
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        local.set 2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 2
          i32.eq
          br_if 2 (;@1;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 5
          i32.const -1
          i32.add
          local.tee 5
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      return
    end
    local.get 0)
  (func $dummy.1 (type 2) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.1)
  (func $wctomb (type 2) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 0
      call $wcrtomb
      return
    end
    i32.const 0)
  (func $wcrtomb (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i32.const 1
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=4952
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 2047
                  i32.gt_u
                  br_if 1 (;@6;)
                  local.get 0
                  local.get 1
                  i32.const 63
                  i32.and
                  i32.const 128
                  i32.or
                  i32.store8 offset=1
                  local.get 0
                  local.get 1
                  i32.const 6
                  i32.shr_u
                  i32.const 192
                  i32.or
                  i32.store8
                  i32.const 2
                  return
                end
                local.get 1
                i32.const -128
                i32.and
                i32.const 57216
                i32.ne
                br_if 1 (;@5;)
                local.get 0
                local.get 1
                i32.store8
                i32.const 1
                return
              end
              local.get 1
              i32.const 55296
              i32.lt_u
              br_if 1 (;@4;)
              local.get 1
              i32.const -8192
              i32.and
              i32.const 57344
              i32.eq
              br_if 1 (;@4;)
              local.get 1
              i32.const -65536
              i32.add
              i32.const 1048575
              i32.gt_u
              br_if 2 (;@3;)
              local.get 0
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=3
              local.get 0
              local.get 1
              i32.const 18
              i32.shr_u
              i32.const 240
              i32.or
              i32.store8
              local.get 0
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=2
              local.get 0
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=1
              i32.const 4
              return
            end
            i32.const 0
            i32.const 25
            i32.store offset=3904
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 3
          return
        end
        i32.const 0
        i32.const 25
        i32.store offset=3904
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $frexp (type 11) (param f64 i32) (result f64)
    (local i64 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.reinterpret_f64
        local.tee 2
        i64.const 52
        i64.shr_u
        i32.wrap_i64
        i32.const 2047
        i32.and
        local.tee 3
        i32.const 2047
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.eq
          br_if 2 (;@1;)
          local.get 0
          f64.const 0x1p+64 (;=1.84467e+19;)
          f64.mul
          local.get 1
          call $frexp
          local.set 0
          local.get 1
          local.get 1
          i32.load
          i32.const -64
          i32.add
          i32.store
          local.get 0
          return
        end
        local.get 1
        local.get 3
        i32.const -1022
        i32.add
        i32.store
        local.get 2
        i64.const -9218868437227405313
        i64.and
        i64.const 4602678819172646912
        i64.or
        f64.reinterpret_i64
        local.set 0
      end
      local.get 0
      return
    end
    local.get 1
    i32.const 0
    i32.store
    local.get 0)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 70784))
  (global (;1;) i32 (i32.const 70784))
  (global (;2;) i32 (i32.const 5236))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "_start" (func $_start))
  (elem (;0;) (i32.const 1) $__stdio_close $__stdout_write $__stdio_seek $__stdio_write)
  (data (;0;) (i32.const 1024) "Hello World\0a\00\00\00\00\88\13\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\19\12D;\02?,G\14=30\0a\1b\06FKE7\0fI\0e\17\03@\1d<+6\1fJ-\1c\01 %)!\08\0c\15\16\22.\108>\0b41\18/A\099\11#C2B:\05\04&('\0d*\1e5\07\1aH\13$L\ff\00\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00No error information\00\00-+   0X0x\00(null)\00\00\00\00\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\000123456789ABCDEF-0X+0X 0X-0x+0x 0x\00inf\00INF\00nan\00NAN\00.\00")
  (data (;1;) (i32.const 3408) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (;2;) (i32.const 5000) "\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00X\0f\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\88\13\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\03\00\00\00\84\13\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00"))
