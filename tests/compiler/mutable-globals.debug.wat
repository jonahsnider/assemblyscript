(module
 (type $none_=>_none (func))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (import "mutable-globals" "external" (global $mutable-globals/external (mut i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $mutable-globals/internal (mut i32) (i32.const 124))
 (global $~lib/memory/__data_end i32 (i32.const 76))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 16460))
 (global $~lib/memory/__heap_base i32 (i32.const 16460))
 (global $~started (mut i32) (i32.const 0))
 (memory $0 1)
 (data (i32.const 12) "<\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00$\00\00\00m\00u\00t\00a\00b\00l\00e\00-\00g\00l\00o\00b\00a\00l\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (table $0 1 funcref)
 (elem $0 (i32.const 1))
 (export "external" (global $mutable-globals/external))
 (export "internal" (global $mutable-globals/internal))
 (export "memory" (memory $0))
 (export "_start" (func $~start))
 (func $start:mutable-globals
  global.get $mutable-globals/external
  i32.const 123
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 5
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $mutable-globals/internal
  i32.const 124
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 6
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $mutable-globals/external
  i32.const 10
  i32.add
  global.set $mutable-globals/external
  global.get $mutable-globals/internal
  i32.const 10
  i32.add
  global.set $mutable-globals/internal
  global.get $mutable-globals/external
  i32.const 133
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 11
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $mutable-globals/internal
  i32.const 134
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 12
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~start
  global.get $~started
  if
   return
  end
  i32.const 1
  global.set $~started
  call $start:mutable-globals
 )
)
