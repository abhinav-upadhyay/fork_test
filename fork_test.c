#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

extern char **environ; // Use the existing environment

int main(void) {
    pid_t pid = fork();


    if (pid == 0) {
        // Child process: execute "ls"
        char *ls_args[] = {"ls", NULL};
        execve("/usr/bin/ls", ls_args, environ);

        // If execve fails
        perror("execve failed");
        exit(EXIT_FAILURE);
    }

    // Parent process
    printf("Child pid %jd\n", (intmax_t)pid);

    // Wait for the child process to finish
    if (wait(NULL) == -1) {
        perror("wait failed");
    }

    exit(EXIT_SUCCESS);
}

