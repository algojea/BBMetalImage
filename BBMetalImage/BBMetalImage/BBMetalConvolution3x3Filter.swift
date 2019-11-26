//
//  BBMetalConvolution3x3Filter.swift
//  BBMetalImage
//
//  Created by Kaibo Lu on 11/22/19.
//  Copyright © 2019 Kaibo Lu. All rights reserved.
//

public class BBMetalConvolution3x3Filter: BBMetalBaseFilter {
    public var convolution: matrix_float3x3
    
    public init(convolution: matrix_float3x3 = matrix_float3x3(rows: [float3(0, 0, 0),
                                                                      float3(0, 1, 0),
                                                                      float3(0, 0, 0)])) {
        self.convolution = convolution
        super.init(kernelFunctionName: "convolution3x3Kernel")
    }
    
    public override func updateParameters(forComputeCommandEncoder encoder: MTLComputeCommandEncoder) {
        encoder.setBytes(&convolution, length: MemoryLayout<matrix_float3x3>.size, index: 0)
    }
}