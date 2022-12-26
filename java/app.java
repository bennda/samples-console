import java.util.Random;

class Parameters {
    public String Mode;
    public String Text;
    public int RandomMin;
    public int RandomMax;

    public Parameters() {
        this("");
    }

    public Parameters(String text) {
        this("echo", text, 0, 1000);
    }

    public Parameters(String mode, String text) {
        this(mode, text, 0, 1000);
    }

    public Parameters(String mode, String text, int randomMin, int randomMax) {
        this.Mode = mode;
        this.Text = text;
        this.RandomMin = randomMin;
        this.RandomMax = randomMax;
    }
}

class app {

    private static Parameters GetParameters(String[] args) {
        Parameters params = new Parameters();

        for (int i = 0; i < args.length; i++) {
            String arg = args[i];
            if (arg.startsWith("-m=") || arg.startsWith("--mode=")) {
                params.Mode = arg.split("=", 2)[1];
            } else if (arg.startsWith("-t=") || arg.startsWith("--text=")) {
                params.Text = arg.split("=", 2)[1];
            } else if (arg.startsWith("--randmin=")) {
                params.RandomMin = Integer.parseInt(arg.split("=", 2)[1]);
            } else if (arg.startsWith("--randmax=")) {
                params.RandomMax = Integer.parseInt(arg.split("=", 2)[1]);
            }

        }

        return params;
    }

    private static int GetRandomNumber(int minimum, int maximum) {
        Random rand = new Random();
        return minimum + rand.nextInt(maximum - minimum);
    }

    public static void main(String[] args) {
        Parameters params = GetParameters(args);

        switch (params.Mode) {
            case "echo":
                System.out.println(params.Text);
                break;
            case "random":
                System.out.println(GetRandomNumber(0, 1000));
                break;
        }
    }
}