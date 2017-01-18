package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 18/01/2017.
 */

public class DomoNetwork implements Serializable {
    private boolean simulator;
    private boolean zwave;

    public DomoNetwork() {}

    public DomoNetwork(boolean simulator, boolean zwave) {
        this.simulator = simulator;
        this.zwave = zwave;
    }

    public boolean isSimulator() {
        return simulator;
    }

    public void setSimulator(boolean simulator) {
        this.simulator = simulator;
    }

    public boolean isZwave() {
        return zwave;
    }

    public void setZwave(boolean zwave) {
        this.zwave = zwave;
    }
}
