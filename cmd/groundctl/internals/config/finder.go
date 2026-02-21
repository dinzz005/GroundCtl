package config

import (
	"errors"
	"os"
	"path/filepath"
)

var filenames = []string{
	"groundctl.yaml",
	"groundctl.yml",
	".groundctl.yaml",
	".groundctl.yml",
}

func FindManifest() (string, error) {
	dir, err := os.Getwd()
	if err != nil {
		return "", err
	}
	for _, name := range filenames {
		path := filepath.Join(dir, name)
		if stat, err := os.Stat(path); err == nil && !stat.IsDir() {
			return path, nil
		}
	}
	return "", errors.New("config file not found.")
}

func FindManifestByPath(path string) (string, error) {
	if stat, err := os.Stat(path); err == nil && !stat.IsDir() {
		return path, nil
	}
	return "", errors.New("config file not found at specified path.")

}
