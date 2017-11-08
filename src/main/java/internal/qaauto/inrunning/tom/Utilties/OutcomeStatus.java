package internal.qaauto.inrunning.tom.Utilties;

/**
 * Created by rkora on 26/11/2014.
 */
public enum OutcomeStatus {
    ACCEPTED("accepted"), REJECTED("rejected"), PENDING("pending"), IDLE("idle");

    private String status;

    OutcomeStatus(final String status) {
        this.status = status;
    }

    public String getStatusLabel() {
        return status;
    }
}

