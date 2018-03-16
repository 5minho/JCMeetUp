//
//  Extension+XCTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    open override func setUp() {
        super.setUp()
        print("테스트 시작 전 사용 가능한 메모리: \(self.freeMemory)")
    }
    
    open override func tearDown() {
        super.tearDown()
        print("테스트 종류 후 사용 가능한 메모리: \(self.freeMemory)")
    }
    
    // 사용중인 메모리
    private var usedMemory : UInt {
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout.size(ofValue: info) / MemoryLayout<integer_t>.size)
        let kerr = withUnsafeMutablePointer(to: &info) { infoPtr in
            return infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                (machPtr: UnsafeMutablePointer<integer_t>) in
                return task_info( mach_task_self_,
                                  task_flavor_t(MACH_TASK_BASIC_INFO),
                                  machPtr,
                                  &count )
            }

        }
        guard kerr == KERN_SUCCESS else { return 0 } 
        return UInt(info.resident_size)
    }
    
    // 가상 메모리 페이지 크기 가져오기
    private var vmPageSize : UInt {
        var pageSize: vm_size_t = 0
        let result = withUnsafeMutablePointer(to: &pageSize) { (size) -> kern_return_t in
            host_page_size(mach_host_self(), size)
        }
        guard result == KERN_SUCCESS else { return 0 }
        return UInt(pageSize)
    }
    
    // 가상 메모리 데이터 가져오기 - returns: 가상 메모리 데이터 구조체
    private var vmStatistics : vm_statistics {
        var vmstat = vm_statistics()
        var count = UInt32(MemoryLayout<vm_statistics>.size / MemoryLayout<integer_t>.size)
        let result = withUnsafeMutablePointer(to: &vmstat) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                return host_statistics(mach_host_self(), HOST_VM_INFO, host_info_t($0), &count)
            }
        }
        guard result == KERN_SUCCESS else { return vm_statistics() }
        return vmstat
    }
    
    // 사용가능한 메모리
    private var freeMemory : UInt {
        return UInt(vmStatistics.free_count) * vmPageSize
    }

}
