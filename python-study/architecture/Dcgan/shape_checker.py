def shape_checker(layer_output, expect_shape):
    """
        check layer output shape,
        but this func isn't check batch size(keras outpus batch size is "?")
        argument
            first: layer_output(taple(int)) -> layer output
            second: answer_shape(list(int)) -> expect output shape(not add batch size)
            eg:
                layer_output: (?, 32, 32)
                expect_shape: [32, 32] (* not add batch size)
    """
    layer_output_shape = layer_output.shape
    for i, shape in enumerate(layer_output_shape):
        if i != 0:
            answer_s = shape
            expect_s = expect_shape[i-1]
            assert answer_s == expect_s, f"not match shape: output {layer_output_shape},  expect: {expect_shape}"
    return True